pragma solidity ^0.8.0;

// require, revert, assert --->> gas refund and state values are not updated
//   
contract Errors {

   function testRequire(uint value) pure public {
       require(value > 10, "Wrong value");
   }  

    function testRevert(uint value) pure public {
       if(value > 10) revert('Wrong value');
   }
   
    uint public num = 123;
    function testAssert() view public {
       assert(num == 123);
   }  

   error MyCustomError(address caller, uint value);
    function testCustomError(uint value) view public {
        if(value > 10) revert MyCustomError(msg.sender, 11);
    }

}