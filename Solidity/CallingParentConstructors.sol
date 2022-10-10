pragma solidity ^0.8.0;

contract A {
    string name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract B {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// Here the contract C is inheriting contract A and B
// The arguments 'Hello' and 'World' passed are the arguments passed to the
// constructors of the respective contracts.

//There are two ways to do this.
// First if you know the arguments before deploying the contract yo do this

contract C is A('Hello'), B('World') {

}

// In this method we don't before hand know what the values passed to the
// constructor of A and B are
contract D is A, B {
    constructor(string memory _name, string memory _text) A(_name) B(_text) {

    }
}







///////////////////////////////////////////////////////////
//////////////////// NEW EXAMPLE //////////////////////////
///////////////////////////////////////////////////////////


contract X {

    event Log(string message);

    function foo() public virtual {
        emit Log('X. foo');
    }

}

contract Y is X {

    function foo() public virtual override {
        emit Log('Y. foo');
    }
}

