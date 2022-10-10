pragma solidity ^0.8.0;

////////////// SIGNATURES ////////////////////

// 1)
// hash (message). 
// Here we hash the message.

// 2) 
// sign(hash(message), signature) offchain. 
// Here we sign the msg which is done offchain

// 3)
// ecrecover(hash(message), signature) == signer 
// verification

contract VerifySig {

    function _split(bytes memory _sig) internal pure returns(bytes32 r, bytes32 s, uint v) {
        require(_sig.length == 65, "invalid signature length");
        
        assembly {
            r:= mload(add(_sig, 32))
            s:= mload(add(_sig, 64))
            v:= byte(0, mload(add(_sig, 96)))
        }
    }

    function getMessageHash(string memory _message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns(bytes32) {
        return keccak256(abi.encodePacked('\x19Ethereum Signed Message:\n32', _messageHash));
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sig) public pure returns(address) {
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function verify(address _signer, string memory _message, bytes memory _sig) 
    external pure returns(bool) {
        
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(getEthSignedMessageHash, _sig) == _signer;

    }


}