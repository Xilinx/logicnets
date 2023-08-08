
import pytest
from hypothesis import given
from hypothesis import strategies as st

from random import randint

import torch

from logicnets.init import random_restrict_fanin

N_MIN=1
N_MAX=100
M_MIN=1
M_MAX=100
SEED_MIN=0
SEED_MAX=10

@pytest.fixture
def expected_exception(request):
    shape = request.node.funcargs['shape']
    length = len(shape)
    if length == 1:
        return ValueError
    else:
        return AssertionError

@given(n=st.integers(min_value=N_MIN, max_value=N_MAX), m=st.integers(min_value=M_MIN, max_value=M_MAX), seed=st.integers(min_value=SEED_MIN,max_value=SEED_MAX))
@pytest.mark.hypothesis
def test_init(n, m, seed):
    torch.manual_seed(seed)
    mask = torch.rand((n,m))
    fan_in = randint(1,m)
    new_mask = random_restrict_fanin(mask, fan_in)
    for i in range(n):
        assert fan_in == torch.sum(mask[i] == 1.0)
        assert (m - fan_in) == torch.sum(mask[i] == 0.0)

@pytest.mark.parametrize("shape", [(1,), (1,1,1)])
def test_init_fails(shape, expected_exception):
    mask = torch.zeros(shape)
    fan_in = 1
    with pytest.raises(expected_exception):
        random_restrict_fanin(mask, fan_in)

