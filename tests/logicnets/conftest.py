
import pytest
from hypothesis import settings, Verbosity

import os
import numpy as np

import torch

settings.register_profile("ci", max_examples=1000, deadline=None)
settings.register_profile("dev", max_examples=10, deadline=None)
settings.register_profile("debug", parent=settings.get_profile("dev"), verbosity=Verbosity.verbose)
settings.load_profile(os.getenv("HYPOTHESIS_PROFILE", "dev"))

@pytest.fixture(scope="session")
def fetch_device():
    def _device(gpu):
        if gpu:
            if torch.cuda.is_available():
                device = "cuda"
            else:
                device = "cpu"
        else:
            device = "cpu"
        return device
    return _device

@pytest.fixture(scope="session")
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

@pytest.fixture(scope="session")
def fetch_result():
    def _fetch_result(x):
        return x.detach().cpu().numpy()
    return _fetch_result

@pytest.fixture(scope="session")
def allclose():
    def _allclose(x, y):
        return np.allclose(x, y, rtol=1e-05, atol=1e-08, equal_nan=True)
    return _allclose

@pytest.fixture(scope="session")
def allexact():
    def _allexact(x, y):
        return np.allclose(x, y, rtol=0, atol=0, equal_nan=True)
    return _allexact

