pragma solidity >=0.4.22 <0.6.0;

contract MyAssertion {
  // "Vanilla" Solidity assertion
  
  function assertion1(uint256 x) public {
   
    // x must never be 1!
    
    assert(x != 1337);
  }    

  // MythX-style assertion
  /// expects { x == 1337 }
  function assertion(uint256 x) public {
      
    // x must never be 1!
  }
}
