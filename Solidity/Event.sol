pragma solidity ^0.8.0;

contract Event {

    event Log(string message, uint val);

    // With the 'indexed' it is easier to fetch data from the blockchain as
    // it is indexed here we are indexing with the address of the sender
    // An event can have upto 3 indexed values
    event IndexedLog(address indexed sender, uint val);

    function example() public {
        emit Log('Foo', 123);
    }

}