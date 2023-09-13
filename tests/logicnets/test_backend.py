
import pytest

import torch

# A simple test to flag an xfail (or should if be skip?) if no GPU is available
@pytest.mark.parametrize("gpu", [
    False,
    pytest.param(True, marks=pytest.mark.xfail(condition=not torch.cuda.is_available(), reason="GPU not available on current platform")),
#    pytest.param(True, marks=pytest.mark.skipif(condition=not torch.cuda.is_available(), reason="GPU not available on current platform")),
])
def test_gpu(gpu, fetch_device):
    device = fetch_device(gpu)
    assert device == "cuda" if gpu else "cpu"

