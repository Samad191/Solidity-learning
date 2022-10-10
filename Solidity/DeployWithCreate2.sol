pragma solidity ^0.8.0;



///  With this approach we get the address of the contract before even
// deploying the contract. 

// 1)
//we first go and copy paste the contract in remix

// 2)
// call the 'getByteCode' func and pass an address from which we want
// to deploy and it will return the byteCode

// 3)
// Call the 'getAddress' func and pass the byteCode and a salt which is a
// random number could be '777' and it will return an address on which
// the contract is going to be deployed

// 4)
// Now call the 'deploy' func and pass the same salt '777' and will get
// the same address

contract DeployWithCreate2 {

    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

}

contract Create2Factory {

    event Deploy(address addr);

    function deploy(uint _salt) external {

        //////// One way of deploying without 'Create2' ///////
        // DeployWithCreate2 _contract = new DeployWithCreate2(msg.sender);

        DeployWithCreate2 _contract = new DeployWithCreate2{
            salt: bytes32(_salt)
        }(msg.sender);
        emit Deploy(address(_contract));
    }

    function getAddress(bytes memory byteCode, uint _salt) 
    public view returns(address) {
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff), 
        address(this), _salt, keccak256(byteCode)));

        return address(uint160(uint(hash)));
    }

    function getByteCode(address _owner) public pure returns(bytes memory){
        bytes memory byteCode = type(DeployWithCreate2).creationCode;
        return abi.encodePacked(byteCode, abi.encode(_owner));
    }

}