// ConsenSys Diligence
// NorthSec 2019
// Montreal, Canada

pragma solidity ^0.5.4;

// Can you have a gazillion balance?

contract challenge1 {
   
    uint256 public balance;
    
    constructor() public payable {
        balance = 10;
    }
    
    function buy() public payable {
        balance += msg.value;
    }
    
    function burn(uint256 amount) public {
        balance -= amount;
    }

}