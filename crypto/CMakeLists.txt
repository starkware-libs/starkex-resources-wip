python_package(starkware_crypto starkware_crypto
    setup.py
    starkware/__init__.py
    starkware/crypto/__init__.py
    starkware/crypto/signature/__init__.py
    starkware/crypto/signature/fast_pedersen_hash.py
    starkware/crypto/signature/math_utils.py
    starkware/crypto/signature/nothing_up_my_sleeve_gen.py
    starkware/crypto/signature/pedersen_params.json
    starkware/crypto/signature/signature.py
    starkware/crypto/signature/starkex_messages.py
)

python_lib(starkware_crypto_lib
    FILES
    starkware/crypto/__init__.py
    starkware/crypto/signature/__init__.py
    starkware/crypto/signature/fast_pedersen_hash.py
    starkware/crypto/signature/math_utils.py
    starkware/crypto/signature/nothing_up_my_sleeve_gen.py
    starkware/crypto/signature/pedersen_params.json
    starkware/crypto/signature/signature.py
    starkware/crypto/signature/starkex_messages.py

    LIBS
    pip_ecdsa
    pip_fastecdsa
    pip_mpmath
    pip_sympy
)
