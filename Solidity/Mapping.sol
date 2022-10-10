pragma solidity ^0.8.0;

contract Mapping {
    mapping(address => uint) public balances;
    mapping (address => bool) public isFriend;

    function examples() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)]; // the default address
        
        balances[msg.sender] = 456;
        delete balances[msg.sender];
        // by deleting the value will be set to default which in zero (uint)
        // isFriend[msg.sender][address(this)] = true;
    }

}

contract IterableMapping {

    mapping (address => uint) public balances;
    mapping (address => bool) public inserted;
    address[] public keys;

    function set(address key, uint val) external {
        balances[key] = val;

        if(!inserted[key]) {
            inserted[key] = true;
            keys.push(key);
        }
    }

    function getSize() external view returns(uint) {
        return keys.length;
    }

}