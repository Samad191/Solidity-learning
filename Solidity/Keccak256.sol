pragma solidity ^0.8.0;

contract HashFunc {

    function hashAbiEncode(string memory text, uint num, address addr) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

 // Encode returns the data into bytes 
    function encode(string memory text, uint num, address addr) public pure returns(bytes memory) {
        return abi.encode(text, num, addr);
    }

    // encode packed shortens the data
     function hashAbiEncodePacked(string memory text, uint num, address addr) public pure returns(bytes memory) {
        return abi.encodePacked(text, num, addr);
    }

    // Example A
    // if encode packed gets two arguments 
    // first -->> '111' second -->> '222'

    // Example B
    // and again gets two arguments
    // first '11' and second '1222'

    // Encode Packed will give the same hash hence 'Hash Collision'. This can be
    // avoided with adding a SALT. 
    // first '11' second 'abc' (random words) third '1222'. first and third could
    // be interchangeable 
}
