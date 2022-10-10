pragma solidity ^0.8.0;

// contract 
// 3 ways to send ETH
// transfer - 2300 gas, reverts
// send - 2300 gas, returns bool
// call - all gas, returns bool and data

contract SendEther {

    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(1);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(1);
        require(sent, 'send failed');
    }

    function sendViaCall(address payable _to) external payable {
        (bool success, bytes memory data) = _to.call{ value: 1 }('');
        require(success, 'call failed!');
    }

}