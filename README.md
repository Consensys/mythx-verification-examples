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

