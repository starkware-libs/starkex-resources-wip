import random

import pytest

from starkware.crypto.signature import EC_ORDER
from starkware.crypto.signature import pedersen_hash as slow_pedersen_hash
# The two implementations of fast pedersen hash only differ by the types of their input
# and output.
from starkware.crypto.signature.fast_pedersen_hash import (
    HASH_SHIFT_POINT, pedersen_hash, pedersen_hash_func)


@pytest.mark.parametrize('hash_func', [pedersen_hash, pedersen_hash_func])
def test_zero_element(hash_func):
    zero = 0
    expected_res = HASH_SHIFT_POINT.x
    if hash_func is pedersen_hash_func:
        zero, expected_res = (value.to_bytes(32, 'big') for value in (zero, expected_res))

    assert expected_res == hash_func(zero, zero)


@pytest.mark.parametrize('hash_func', [pedersen_hash, pedersen_hash_func])
def test_random_hash(hash_func):
    x = random.randint(0, EC_ORDER - 1)
    y = random.randint(0, EC_ORDER - 1)
    expected_res = slow_pedersen_hash(x, y)

    if hash_func is pedersen_hash_func:
        x, y, expected_res = (value.to_bytes(32, 'big') for value in (x, y, expected_res))

    assert expected_res == hash_func(x, y)
