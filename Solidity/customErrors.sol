pragma solidity ^0.8.0;

error UnAuthorized(address caller);

contract VendingMachine {

    address payable owner = payable(msg.sender);

    function withdraw() public {
        if(msg.sender != owner) {

            // here we created our own "Custom error" which requires less gas
            revert UnAuthorized(msg.sender);

            // this requires more gas
            // revert("Error");
        }
        owner.transfer(address(this).balance);
    }

}