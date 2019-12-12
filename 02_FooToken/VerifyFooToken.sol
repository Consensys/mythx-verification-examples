pragma solidity 0.5.11;

import "./FooToken.sol";

contract VerifyERC20 is FooToken {

  event AssertionFailed(string message);

  // Add this modifier to all public functions

  modifier checkInvariants() {
  	uint256 old_totalSupply = _totalSupply;

  	_;

    if (old_totalSupply != _totalSupply) {
      emit AssertionFailed("Total supply was altered");
    }
  }

  function balanceOf(address _owner) public view returns (uint256) {
    uint256 _balance = super.balanceOf(_owner);

    // Account balance must not exceed total supply. Using a normal assertion here because events aren't allowed in views.

    assert(_balance <= _totalSupply);

    return _balance;
  }

  function transfer(address _to, uint256 _value) checkInvariants public returns (bool) {

    uint256 oldBalanceTo = balanceOf(_to);
    uint256 oldBalanceSender = balanceOf(msg.sender);
    uint256 oldSum = oldBalanceTo + oldBalanceSender;

    super.transfer(_to, _value);
    
    uint256 newSum = balanceOf(msg.sender) + balanceOf(_to);

    if (oldSum != newSum) {
      emit AssertionFailed("Sum of sender and receiver balances differs after transfer");
    }

    if (balanceOf(_to) < oldBalanceTo) {
      emit AssertionFailed("Balance of receiver has decreased following transfer");
    }

    if (balanceOf(msg.sender) > oldBalanceSender) {
      emit AssertionFailed("Balance of sender has increased following transfer");
    }
  }

  function approve(address _spender, uint256 _value) checkInvariants public returns (bool) {
    super.approve(_spender, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) checkInvariants public returns (bool) {
  	super.transferFrom(_from, _to, _value);
  }

}