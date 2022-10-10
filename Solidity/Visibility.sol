// visibility 

// private - only inside contract
// internal - only inside contract and child contracts
// public - inside and outside contract
// external - only from outside contract



////////////////////////////////////
//////////// immutable /////////////
////////////////////////////////////

pragma solidity ^0.8.0;

contract Immutable {

    address public immutable owner = msg.sender;

}

contract Payable {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable {}

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

}