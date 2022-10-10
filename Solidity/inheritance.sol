pragma solidity ^0.8.0;

// Here we are inheriting A in B and the functions will be somehow changed
// in the inherited contract (B) so the functions have the keyword of 'virtual'.
// The functions which are to be changed in the inherited contract have the
// keyword of 'virtual'

contract A {

    function foo() public pure virtual returns (string memory) {
        return 'A';
    }

    function bar() public pure virtual returns (string memory) {
        return 'B';
    }

    function baz() public pure returns (string memory) {
        return 'A';
    }
}

// The contract B will have all the functions of contract A but with the keyword
// of override the functions will be over written and the functions of contract B
// will be called hence they have the keywork of 'override' and 'virtual'. The
// contract B will have the function 'baz' which comes from contract 'A'.

contract B is A {

    function foo() public override pure returns(string memory) {
        return 'B';
    }

    function bar() public override pure returns (string memory) {
        return 'B';
    }

}