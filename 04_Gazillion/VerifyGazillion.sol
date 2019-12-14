pragma solidity ^0.5.4;

import "Gazillion.sol";

// Can you have a gazillion balance?

contract VerifyGazillion is challenge1 {
    
    function buy() public payable {

        uint256 initial_balance = balance;

        super.buy();

        // post checks
        assert(balance == initial_balance + msg.value);
        assert(balance >= initial_balance);
    }
    
    function burn(uint256 amount) public {

        uint256 initial_balance = balance;

        super.burn(amount);

        // post checks
        assert(balance == initial_balance - amount);
        assert(balance <= initial_balance);
    }

}

