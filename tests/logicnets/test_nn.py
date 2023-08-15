
import pytest
from hypothesis import given
from hypothesis import strategies as st

import numpy as np

import torch

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

@given( shape=st.lists(st.integers(min_value=MIN_DIM, max_value=MAX_DIM), min_size=MIN_DIMS, max_size=MAX_DIMS),
        seed=st.integers(min_value=SEED_MIN,max_value=SEED_MAX),
        bias=st.floats(allow_infinity=False, allow_nan=False, width=32),
        scale=st.floats(allow_infinity=False, allow_nan=False, width=32))
@pytest.mark.hypothesis
def test_forward_scalar_bias_scale(shape, seed, bias, scale):
    torch.manual_seed(seed)
    x = torch.rand(shape, dtype=torch.float32)
    m = ScalarBiasScale(bias_init=bias, scale_init=scale)
    m.eval()
    y_test = m(x).detach().cpu().numpy()
    y_ref = ((x + bias)*scale).detach().cpu().numpy()
    assert np.allclose(y_test, y_ref)

