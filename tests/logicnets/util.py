
from hypothesis import strategies as st
from hypothesis.extra import numpy as hnp

def gen_ndarray(**shape_kws):
    return hnp.arrays(
                dtype=hnp.floating_dtypes(sizes=(32, 64), endianness='='),
                shape=hnp.array_shapes(**shape_kws),
                elements={'allow_nan': False, 'allow_infinity': False}
            )

