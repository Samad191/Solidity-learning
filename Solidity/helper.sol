pragma solidity ^0.8.0;
import { UnAuthorized } from "./customErrors.sol";

function helper(uint x) view returns (uint) {
    return x * 2;
}

contract TestHelper {
    function test() external view returns(uint) {
        return helper(123);
    }
}