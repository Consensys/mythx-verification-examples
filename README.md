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

