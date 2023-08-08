
from logicnets.nn import    ScalarBiasScale, \
                            ScalarScaleBias, \
                            DenseMask2D, \
                            RandomFixedSparsityMask2D, \
                            SparseLinear

def test_instantiate_scalar_bias_scale():
    m = ScalarBiasScale()
    assert isinstance(m, ScalarBiasScale)

def test_instantiate_scalar_scale_bias():
    m = ScalarBiasScale()
    assert isinstance(m, ScalarBiasScale)

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

