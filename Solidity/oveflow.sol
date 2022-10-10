pragma solidity ^0.8.0;

contract OverFlow {

    function helper() public pure returns(uint) {
        uint x = 0;
        x --;
        return x;
    }

    function test() external view returns (uint) {
        uint x = 0;
        unchecked {
            x --;
        }
        return x;
    }
}