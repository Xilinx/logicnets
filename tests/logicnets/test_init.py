
import pytest
from hypothesis import given, strategies as st
from hypothesis.extra import numpy as hnp

import numpy as np

import torch

from logicnets.init import random_restrict_fanin

from tests.logicnets.util import gen_ndarray

N_MIN=1
N_MAX=100
M_MIN=1
M_MAX=100
MIN_DIM=1
MAX_DIM=10
MIN_DIMS=2
MAX_DIMS=2
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

@given( mask_np=gen_ndarray(min_dims=MIN_DIMS, max_dims=MAX_DIMS, min_side=MIN_DIM, max_side=MAX_DIM),
        gpu=st.booleans(),
        )
@pytest.mark.hypothesis
@torch.no_grad()
def test_init(mask_np, gpu, fetch_device, fetch_dtype, fetch_result, allexact):
    device = fetch_device(gpu)
    dtype = fetch_dtype(mask_np.dtype)
    n, m = mask_np.shape[0], mask_np.shape[1]
    mask = torch.from_numpy(mask_np).to(device)
    fan_in = np.random.randint(1,m+1)
    new_mask = random_restrict_fanin(mask, fan_in)
    for i in range(n):
        assert allexact(m, fetch_result(torch.sum(mask[i] == 1.0)))
        assert allexact((m - fan_in), fetch_result(torch.sum(mask[i] == 0.0)))

@pytest.mark.parametrize("shape", [(1,), (1,1,1)])
@torch.no_grad()
def test_init_fails(shape, expected_exception):
    mask = torch.zeros(shape)
    fan_in = 1
    with pytest.raises(expected_exception):
        random_restrict_fanin(mask, fan_in)

