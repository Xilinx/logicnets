
import pytest
from hypothesis import given, strategies as st, example
from hypothesis.extra import numpy as hnp

import numpy as np

import torch

from brevitas.nn import QuantReLU, QuantHardTanh
from brevitas.core.quant import QuantType
from brevitas.core.scaling import ScalingImplType
from brevitas.core.restrict_val import RestrictValueType

from logicnets.quant import QuantBrevitasActivation

from tests.logicnets.util import gen_ndarray, gen_bit_width, gen_power_of_two, wrap

MIN_DIM=1
MAX_DIM=10
MIN_DIMS=1
MAX_DIMS=5
SCALING_MIN_VAL=1e-8

def test_instantiate_quant_brevitas_activation():
    qa = QuantReLU(bit_width=2, max_val=1.0, quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER)
    m = QuantBrevitasActivation(qa)
    assert isinstance(m, QuantBrevitasActivation)

# TODO: Make this for unsigned activations
@given( x_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        bit_width=gen_bit_width(min_val=2),
        scale_factor=gen_power_of_two(min_val=-1, max_val=0),
        gpu=st.booleans(),
        float_scale=st.booleans(),
        )
@example(bit_width=2, x_np=np.array([0.25], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=2, x_np=np.array([0.25], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=2, x_np=np.array([0.2500000298023223876953125], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=2, x_np=np.array([0.2500000298023223876953125], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=2, x_np=np.array([0.24999998509883880615234375], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=2, x_np=np.array([0.24999998509883880615234375], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=3, x_np=np.array([0.75], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=3, x_np=np.array([0.75], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=3, x_np=np.array([0.750000059604644775390625], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=3, x_np=np.array([0.750000059604644775390625], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=3, x_np=np.array([0.749999940395355224609375], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=3, x_np=np.array([0.749999940395355224609375], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@wrap(example(bit_width=1, x_np=np.array([0.5], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False).xfail(reason="Brevitas issue when initialising scale factor with bit_width=1", raises=AssertionError))
@wrap(example(bit_width=1, x_np=np.array([0.5], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False).xfail(reason="Brevitas issue when initialising scale factor with bit_width=1", raises=AssertionError))
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_quant_relu_brevitas_activation(x_np, bit_width, scale_factor, gpu, float_scale, fetch_device, fetch_dtype, fetch_result, allexact, allclose):
    if float_scale:
        validate=allclose
        restrict_scaling_type=RestrictValueType.FP
    else:
        validate=allexact
        restrict_scaling_type=RestrictValueType.POWER_OF_TWO
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    x = torch.from_numpy(x_np).to(device)
    qa = QuantReLU(bit_width=bit_width, max_val=scale_factor*(2**bit_width-1), quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER, restrict_scaling_type=restrict_scaling_type, scaling_min_val=SCALING_MIN_VAL)
    module = QuantBrevitasActivation(qa).to(device, dtype)
    module.eval()
    sf, bits = module.get_scale_factor_bits()
    assert bits == bit_width
    if not validate(fetch_result(sf), scale_factor):
        print(f"{fetch_result(sf):.16e}, {scale_factor:.16e}")
    assert validate(fetch_result(sf), scale_factor)
    y_test = fetch_result(qa(x))
    y_ref = fetch_result(torch.clamp(torch.round(x / scale_factor), 0, (2**bit_width - 1))*scale_factor)
    assert validate(y_test, y_ref)

# TODO: Make this for signed activations
@given( x_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        bit_width=gen_bit_width(min_val=2),
        scale_factor=gen_power_of_two(min_val=-1, max_val=0),
        gpu=st.booleans(),
        float_scale=st.booleans(),
        )
@example(bit_width=2, x_np=np.array([0.25], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=2, x_np=np.array([0.25], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=2, x_np=np.array([0.2500000298023223876953125], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=2, x_np=np.array([0.2500000298023223876953125], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=2, x_np=np.array([0.24999998509883880615234375], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=2, x_np=np.array([0.24999998509883880615234375], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=3, x_np=np.array([0.75], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=3, x_np=np.array([0.75], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=3, x_np=np.array([0.750000059604644775390625], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=3, x_np=np.array([0.750000059604644775390625], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@example(bit_width=3, x_np=np.array([0.749999940395355224609375], dtype=np.float32), scale_factor=0.5, gpu=False, float_scale=False)
@example(bit_width=3, x_np=np.array([0.749999940395355224609375], dtype=np.float32), scale_factor=0.5, gpu=True, float_scale=False)
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_quant_hardtanh_brevitas_activation(x_np, bit_width, scale_factor, gpu, float_scale, fetch_device, fetch_dtype, fetch_result, allexact, allclose):
    if float_scale:
        validate=allclose
        restrict_scaling_type=RestrictValueType.FP
    else:
        validate=allexact
        restrict_scaling_type=RestrictValueType.POWER_OF_TWO
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    x = torch.from_numpy(x_np).to(device)
    qa = QuantHardTanh(bit_width=bit_width, max_val=scale_factor*(2**(bit_width-1)), quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER, restrict_scaling_type=restrict_scaling_type, scaling_min_val=SCALING_MIN_VAL)
    module = QuantBrevitasActivation(qa).to(device, dtype)
    module.eval()
    sf, bits = module.get_scale_factor_bits()
    assert bits == bit_width
    if not validate(fetch_result(sf), scale_factor):
        print(f"{fetch_result(sf):.16e}, {scale_factor:.16e}")
    assert validate(fetch_result(sf), scale_factor)
    y_test = fetch_result(qa(x))
    y_ref = fetch_result(torch.clamp(torch.round(x / scale_factor), - 2**(bit_width-1), (2**(bit_width-1) - 1))*scale_factor)
    assert validate(y_test, y_ref)

# TODO: Make this for signed activations
@given( x_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        scale_factor=gen_power_of_two(min_val=-1, max_val=0),
        gpu=st.booleans(),
        float_scale=st.booleans(),
        )
@example(x_np=np.array([0.0], dtype=np.float32), scale_factor=1.0, gpu=False, float_scale=False)
@example(x_np=np.array([0.0], dtype=np.float32), scale_factor=1.0, gpu=True, float_scale=False)
@example(x_np=np.array([1.40129846432e-45], dtype=np.float32), scale_factor=1.0, gpu=False, float_scale=False)
@example(x_np=np.array([1.40129846432e-45], dtype=np.float32), scale_factor=1.0, gpu=True, float_scale=False)
@example(x_np=np.array([-1.40129846432e-45], dtype=np.float32), scale_factor=1.0, gpu=False, float_scale=False)
@example(x_np=np.array([-1.40129846432e-45], dtype=np.float32), scale_factor=1.0, gpu=True, float_scale=False)
@pytest.mark.hypothesis
@torch.no_grad()
def test_forward_quant_bipolar_hardtanh_brevitas_activation(x_np, scale_factor, gpu, float_scale, fetch_device, fetch_dtype, fetch_result, allexact, allclose):
    if float_scale:
        validate=allclose
        restrict_scaling_type=RestrictValueType.FP
    else:
        validate=allexact
        restrict_scaling_type=RestrictValueType.POWER_OF_TWO
    device = fetch_device(gpu)
    dtype = fetch_dtype(x_np.dtype)
    x = torch.from_numpy(x_np).to(device)
    qa = QuantHardTanh(bit_width=1, max_val=scale_factor, min_val=-scale_factor, quant_type=QuantType.BINARY, scaling_impl_type=ScalingImplType.PARAMETER, restrict_scaling_type=restrict_scaling_type, scaling_min_val=SCALING_MIN_VAL)
    module = QuantBrevitasActivation(qa).to(device, dtype)
    module.eval()
    sf, bits = module.get_scale_factor_bits()
    assert bits == 1
    if not validate(fetch_result(sf), scale_factor):
        print(f"{fetch_result(sf):.16e}, {scale_factor:.16e}")
    assert validate(fetch_result(sf), scale_factor)
    bp_val = torch.ones((1,), dtype=dtype, device=device)
    y_test = fetch_result(qa(x))
    y_ref = fetch_result(torch.where(x >= 0, bp_val, -bp_val)*scale_factor)
    assert validate(y_test, y_ref)

