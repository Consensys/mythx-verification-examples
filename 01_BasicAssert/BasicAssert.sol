pragma solidity >=0.4.22 <0.6.0;

contract MyAssertion {
  event AssertionFailed(string message);
  
  // "Vanilla" Solidity assertion
  
  function assertion1(uint256 x) public {
   
    // x must never be 1!
    
    assert(x != 1);
  }    

  // MythX-style assertion
  
  function assertion(uint256 x) public {
      
    // x must never be 1!
      
    if (x == 1) {
        emit AssertionFailed("x is 1");        
    }

  }
}
