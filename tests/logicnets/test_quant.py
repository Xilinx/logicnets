
import pytest
from hypothesis import given, strategies as st, settings, HealthCheck, example
from hypothesis.extra import numpy as hnp

import numpy as np

import torch

from brevitas.nn import QuantReLU, QuantHardTanh
from brevitas.core.quant import QuantType
from brevitas.core.scaling import ScalingImplType

from logicnets.quant import QuantBrevitasActivation

from tests.logicnets.util import gen_ndarray, gen_bit_width

MIN_DIM=1
MAX_DIM=10
MIN_DIMS=1
MAX_DIMS=5
MIN_SCALE_FACTOR=1e-8

def test_instantiate_quant_brevitas_activation():
    qa = QuantReLU(bit_width=2, max_val=1.0, quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER)
    m = QuantBrevitasActivation(qa)
    assert isinstance(m, QuantBrevitasActivation)

@given( x_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        bit_width=gen_bit_width(),
        gpu=st.booleans(),
        )
@example(bit_width=2, x_np=np.array([0.25], dtype=np.float32), gpu=False)
@example(bit_width=2, x_np=np.array([0.25], dtype=np.float32), gpu=True)
@example(bit_width=2, x_np=np.array([0.2500000298023223876953125], dtype=np.float32), gpu=False)
@example(bit_width=2, x_np=np.array([0.2500000298023223876953125], dtype=np.float32), gpu=True)
@example(bit_width=2, x_np=np.array([0.24999998509883880615234375], dtype=np.float32), gpu=False)
@example(bit_width=2, x_np=np.array([0.24999998509883880615234375], dtype=np.float32), gpu=True)
@torch.no_grad()
def test_forward_quant_relu_brevitas_activation(x_np, bit_width, gpu, fetch_device, fetch_dtype, fetch_result, allclose):
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    x = torch.from_numpy(x_np).to(device)
    qa = QuantReLU(bit_width=bit_width, max_val=2**(bit_width-1) - 0.5, quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER)
    module = QuantBrevitasActivation(qa).to(device, dtype)
    module.eval()
    scale_factor, bits = module.get_scale_factor_bits()
    assert bits == bit_width
    assert allclose(fetch_result(scale_factor), np.array(0.5, dtype=x_np.dtype))
    y_test = fetch_result(qa(x))
    y_ref = fetch_result(torch.clamp(torch.round(x / scale_factor), 0, (2**bit_width - 1))*scale_factor)
    assert allclose(y_test, y_ref)

