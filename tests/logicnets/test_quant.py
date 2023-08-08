
from brevitas.nn import QuantReLU
from brevitas.core.quant import QuantType
from brevitas.core.scaling import ScalingImplType

from logicnets.quant import QuantBrevitasActivation

def test_instantiate_quant_brevitas_activation():
    qa = QuantReLU(bit_width=2, max_val=1.0, quant_type=QuantType.INT, scaling_impl_type=ScalingImplType.PARAMETER)
    m = QuantBrevitasActivation(qa)
    assert isinstance(m, QuantBrevitasActivation)

