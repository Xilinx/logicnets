
import pytest
from hypothesis import given, strategies as st
from hypothesis.extra import numpy as hnp

import numpy as np

import torch
import torch.nn.functional as F

from brevitas.nn import QuantReLU
from brevitas.core.quant import QuantType
from brevitas.core.scaling import ScalingImplType

from logicnets.quant import QuantBrevitasActivation
from logicnets.nn import    ScalarBiasScale, \
                            ScalarScaleBias, \
                            DenseMask2D, \
                            RandomFixedSparsityMask2D, \
                            SparseLinear, \
                            SparseLinearNeq

from tests.logicnets.util import gen_ndarray, gen_seed

N_MIN=1
N_MAX=100
M_MIN=1
M_MAX=100
MIN_DIM=1
MAX_DIM=10
MIN_DIMS=1
MAX_DIMS=5
SEED_MIN=0
SEED_MAX=10

def gen_mask_choice():
    return st.sampled_from(["dense", "fixed_random"])

def build_mask_2d(choice, m, n, fan_in):
    if choice == "dense":
        return DenseMask2D(m, n)
    elif choice == "fixed_random":
        return RandomFixedSparsityMask2D(m, n, fan_in)
    else:
        raise ValueError(f"Invalid choice for sparsity mask. Choice: {choice}")

def test_instantiate_scalar_bias_scale():
    m = ScalarBiasScale()
    assert isinstance(m, ScalarBiasScale)

def test_instantiate_scalar_scale_bias():
    m = ScalarScaleBias()
    assert isinstance(m, ScalarScaleBias)

def test_instantiate_dense_mask_2d():
    m = DenseMask2D(1, 1)
    assert isinstance(m, DenseMask2D)

def test_instantiate_random_fixed_sparsity_mask_2d():
    m = RandomFixedSparsityMask2D(1, 1, 1)
    assert isinstance(m, RandomFixedSparsityMask2D)

def test_instantiate_sparse_linear():
    mask = DenseMask2D(1, 1)
    m = SparseLinear(1, 1, mask)
    assert isinstance(m, SparseLinear)

def test_instantiate_sparse_linear_neq():
    qi = QuantReLU(bit_width=2, max_val=1.0, quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER)
    qo = QuantReLU(bit_width=2, max_val=1.0, quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER)
    qbi = QuantBrevitasActivation(qi)
    qbo = QuantBrevitasActivation(qo)
    mask = DenseMask2D(1, 1)
    m = SparseLinearNeq(1, 1, qbi, qbo, sparse_linear_kws={'mask': mask})
    assert isinstance(m, SparseLinearNeq)

@given( x_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        bias_init=st.floats(allow_infinity=False, allow_nan=False, width=32),
        scale_init=st.floats(allow_infinity=False, allow_nan=False, width=32),
        gpu=st.booleans(),
        )
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_scalar_bias_scale(x_np, bias_init, scale_init, gpu, fetch_device, fetch_dtype, fetch_result, allclose):
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    x = torch.from_numpy(x_np).to(device)
    m = ScalarBiasScale(bias_init=bias_init, scale_init=scale_init).to(device, dtype)
    m.eval()
    y_test = fetch_result(m(x))
    y_ref = fetch_result((x + bias_init)*scale_init)
    assert allclose(y_test, y_ref)

@given( x_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        bias_init=st.floats(allow_infinity=False, allow_nan=False, width=32),
        scale_init=st.floats(allow_infinity=False, allow_nan=False, width=32),
        gpu=st.booleans(),
        )
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_scalar_scale_bias(x_np, bias_init, scale_init, gpu, fetch_device, fetch_dtype, fetch_result, allclose):
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    x = torch.from_numpy(x_np).to(device)
    m = ScalarScaleBias(bias_init=bias_init, scale_init=scale_init).to(device, dtype)
    m.eval()
    y_test = fetch_result(m(x))
    y_ref = fetch_result((x*scale_init) + bias_init)
    assert allclose(y_test, y_ref)

@given( x_np=gen_ndarray(min_dims=2, max_dims=2, min_side=MIN_DIM, max_side=MAX_DIM),
        gpu=st.booleans(),
        )
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_dense_mask_2d(x_np, gpu, fetch_device, fetch_dtype, fetch_result, allexact):
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    x = torch.from_numpy(x_np).to(device)
    n, m = x_np.shape[0], x_np.shape[1]
    mask = DenseMask2D(m, n).to(device, dtype)
    mask.eval()
    y_test = fetch_result(x*mask())
    y_ref = x_np
    assert allexact(y_test, y_ref)

@given( x_np=gen_ndarray(min_dims=2, max_dims=2, min_side=MIN_DIM, max_side=MAX_DIM),
        gpu=st.booleans(),
        )
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_random_fixed_sparsity_mask_2d(x_np, gpu, fetch_device, fetch_dtype, fetch_result, allexact):
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    x = torch.from_numpy(x_np).to(device)
    n, m = x_np.shape[0], x_np.shape[1]
    fan_in = np.random.randint(1,m+1)
    mask = RandomFixedSparsityMask2D(m, n, fan_in).to(device, dtype)
    mask.eval()
    y_test = fetch_result(x*mask())
    y_ref = x_np
    mask_np = fetch_result(mask())
    if fan_in == m:
        assert allexact(y_test, y_ref)
    else:
        assert allexact(y_test[mask_np == 1.0], y_ref[mask_np == 1.0])
        assert allexact(y_test[mask_np == 0.0], np.zeros_like(y_ref[mask_np == 0.0]))

@given( x_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        n=st.integers(min_value=1, max_value=MAX_DIM),
        bias=st.booleans() | st.none(),
        mask_choice=gen_mask_choice(),
        seed=gen_seed(),
        gpu=st.booleans(),
        )
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_sparse_linear(x_np, n, bias, mask_choice, seed, gpu, fetch_device, fetch_dtype, fetch_result, allclose):
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    torch.manual_seed(seed)
    x = torch.from_numpy(x_np).to(device)
    m = x_np.shape[-1]
    fan_in = np.random.randint(1,m+1)
    mask = build_mask_2d(mask_choice, m, n, fan_in).to(device, dtype)
    if bias is not None:
        module = SparseLinear(m, n, mask, bias=bias).to(device, dtype)
    else:
        module = SparseLinear(m, n, mask).to(device, dtype)
    module.eval()
    y_test = fetch_result(module(x))
    y_ref = fetch_result(F.linear(x, module.weight*mask(), module.bias))
    assert allclose(y_test, y_ref)

@given( x_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        n=st.integers(min_value=1, max_value=MAX_DIM),
        bias=st.booleans() | st.none(),
        mask_choice=gen_mask_choice(),
        seed=gen_seed(),
        gpu=st.booleans(),
        )
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_sparse_linear_neq(x_np, n, bias, mask_choice, seed, gpu, fetch_device, fetch_dtype, fetch_result, allclose):
    qi = QuantReLU(bit_width=2, max_val=1.0, quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER)
    qo = QuantReLU(bit_width=2, max_val=1.0, quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER)
    qbi = QuantBrevitasActivation(qi)
    qbo = QuantBrevitasActivation(qo)
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    torch.manual_seed(seed)
    x = torch.from_numpy(x_np).to(device)
    m = x_np.shape[-1]
    fan_in = np.random.randint(1,m+1)
    mask = build_mask_2d(mask_choice, m, n, fan_in).to(device, dtype)
    if bias is not None:
        module = SparseLinearNeq(m, n, qbi, qbo, sparse_linear_kws={'mask': mask, 'bias': bias}).to(device, dtype)
    else:
        module = SparseLinearNeq(m, n, qbi, qbo, sparse_linear_kws={'mask': mask}).to(device, dtype)
    module.eval()
    y_test = fetch_result(module(x))
    y_ref = fetch_result(qbo(F.linear(qbi(x), module.fc.weight*mask(), module.fc.bias)))
    assert allclose(y_test, y_ref)

