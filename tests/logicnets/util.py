
from hypothesis import strategies as st
from hypothesis.extra import numpy as hnp

def gen_ndarray(**shape_kws):
    return hnp.arrays(
                dtype=hnp.floating_dtypes(sizes=(32, 64), endianness='='),
                shape=hnp.array_shapes(**shape_kws),
                elements={'allow_nan': False, 'allow_infinity': False}
            )

def gen_seed():
    return st.integers(min_value=0, max_value=2**32 - 1)

def gen_bit_width():
    return st.integers(min_value=1, max_value=8)

