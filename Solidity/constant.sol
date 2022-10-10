pragma solidity ^0.8.0;

contract Constant {

    address public constant myValue = 12;

    function abc () public returns(uint) {
        myValue = 1;
    }

}

contract Ternary {

    function test(uint x) public returns(uint) {
        if(x > 10) return 1;
        else return 2;
    } 
contract ForAndWhileLoops {

    function loops() external pure {

        for (uint i=0; i<10; i++) {
            if(i == 5) continue; // When     equal to 5 the code will not be executed
            if(i == 7) break; // Break will finish the loop
             // code; 
        }
    }

}