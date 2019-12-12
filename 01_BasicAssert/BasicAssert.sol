pragma solidity ^0.5.0;

contract MyAssertion {
  event AssertionFailed(string message);
  
  // "Vanilla" Solidity assertion
  
  function assertion1(uint256 x) public {
   
    // x must never be 1!
    
    assert(x != 1337);
  }    

  // MythX-style assertion
  
  function assertion(uint256 x) public {
      
    // x must never be 1!
      
    if (x == 1337) {
        emit AssertionFailed("x is 1337");        
    }

  }
}
