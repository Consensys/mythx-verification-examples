pragma solidity 0.5.11;

import "./FooToken.sol";

contract VerifyERC20 is FooToken {

  event AssertionFailed(string message);
 
  function _transfer(address _to, uint256 _value) public returns (bool) {

    uint256 oldSum = balanceOf(msg.sender) + balanceOf(_to);

    transfer(_to, _value);
    
    uint256 newSum = balanceOf(msg.sender) + balanceOf(_to);

    if (oldSum != newSum) {
      emit AssertionFailed("postcondition of transfer failed");
    }

  }

}