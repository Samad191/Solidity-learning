pragma solidity ^0.8.0;

// Deploy contract
contract Proxy {

    event Deploy(address);

    function deploy(bytes memory _code) external payable returns(address addr) {
        // if we do not write any return statement in the function
        // the value set in the return type will be auto returned which is 'addr'
        assembly {
            // create (v, p, n)
            // v = amount of ether
            // p = pointer in memory to start of code
            // n = size of code
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), 'Deploy failed!');

        emit Deploy(addr);

    }

}