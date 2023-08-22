
import pytest

import numpy as np

import torch

@pytest.fixture
def fetch_device():
    def _device(gpu):
        if gpu:
            if torch.cuda.is_available():
                device = "cuda"
            else:
                pytest.skip("GPU not available")
        else:
            device = "cpu"
        return device
    return _device

@pytest.fixture
def fetch_dtype():
    def _dtype(np_dtype):
        if np_dtype == np.float32:
            torch_dtype = torch.float32
        elif np_dtype == np.float64:
            torch_dtype = torch.float64
        else:
            raise ValueError(f"Unsupported dataype: {np_dtype}")
        return torch_dtype
    return _dtype

@pytest.fixture
def fetch_result():
    def _fetch_result(x):
        return x.detach().cpu().numpy()
    return _fetch_result

