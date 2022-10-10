pragma solidity ^0.8.0;


// self destruct
//  - delete the contract
//  - ether can be sent to any address

contract Kill {

    function kill() external {
        // if the contract has one ether the ether will be sent to the 
        // address passed in the self destruct
        selfdestruct(payable (msg.sender));
    }

}