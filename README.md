# MythX Verification Examples

## [1. Basic Assertion](/01_BasicAssert)

Show how to write and check a basic assertion. MythX supports 2 types:

```
    // Vanilla assert
    
    assert(x != 1);

    // AssertionFailed Event

    if (x == 1) {
        emit AssertionFailed("x is 1");        
    }
```

## [2. FooToken](/02_FooToken)

Check a property of the ERC20 `transfer` function:

- The sum of sender and receiver balance must be equal before and after the transfer

MythX will detect a counterexample where a sender transfer funds to themselves (see also [Valentin's article](https://medium.com/consensys-diligence/checking-custom-correctness-properties-of-smart-contracts-using-mythx-25cbac5d7852)).

## [4. Gazillion](/04_Gazillion)

Sample from a Diligence workshop that contains an integer underflow. We can check the properties:

- The balance increases after a call to buy()
- The balance decreases after a call to burn()

This should detect a counterexample:

```
assert(balance >= initial_balance)
--------------------
Transaction Sequence:

Tx #1:
    Origin: 0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa0 [ USER ]
    Function: burn(uint256) [ 42966c68 ]
    Calldata: 0x42966c68000000000000000000000000000000000000000000000000000000000000000e00000000
    Decoded Calldata: burn(14)
    Value: 0x0
```
