
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

def gen_bit_width(min_val=1, max_val=8):
    return st.integers(min_value=min_val, max_value=max_val)

@st.composite
def gen_power_of_two(draw, min_val=-8, max_val=7):
    power = draw(st.integers(min_value=min_val, max_value=max_val))
    return float(2**power)

