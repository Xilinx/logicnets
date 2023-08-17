
import pytest
from hypothesis import given
from hypothesis import strategies as st
from hypothesis.extra import numpy as hnp

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

@given( x_np=hnp.arrays(
            dtype=hnp.floating_dtypes(sizes=(32, 64), endianness='='),
            shape=hnp.array_shapes(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
            elements={'allow_nan': False, 'allow_infinity': False}
        ),
        bias_init=st.floats(allow_infinity=False, allow_nan=False, width=32),
        scale_init=st.floats(allow_infinity=False, allow_nan=False, width=32))
@pytest.mark.hypothesis
def test_forward_scalar_bias_scale(x_np, bias_init, scale_init):
    x = torch.from_numpy(x_np)
    m = ScalarBiasScale(bias_init=bias_init, scale_init=scale_init)
    if x_np.dtype == np.float32:
        m.float()
    elif x_np.dtype == np.float64:
        m.double()
    else:
        raise ValueError(f"Unsupported dataype: {x_np.dtype}")
    m.eval()
    y_test = m(x).detach().cpu().numpy()
    y_ref = ((x + bias_init)*scale_init).detach().cpu().numpy()
    assert np.allclose(y_test, y_ref)

