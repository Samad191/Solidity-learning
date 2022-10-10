pragma solidity ^0.8.0;

contract Account {

    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }

}

contract AccountFactory {

    Account[] public accounts;
    function createAccount(address _owner) external {
        // here we are deploying the 'Account' contract
        // here in the 'value' we are passing ether as the constructor is payable
        Account account =  new Account{ value: 111 }(_owner);
        //         |
        //         |
        // In this variable 'account' the new contract will be deployed
        accounts.push(account);
    }
    

}