pragma solidity ^0.8.0;

// This is normal call
// A --> B --> C
// if A calls B and sends 100 wei
// msg.sender = A
// msg.value = 100

// now if B calls C and sends 50 wei
// msg.sender = B
// msg.value = 50

// Delegate Call
// A calls B, sends 100 wei
    // B delegates call to C
// A --> B --> C
// So at contract C
// msg.sender = A
//  msg.value = 100

contract TestDelegateCall {

    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }

}

contract DelegateCall {

    uint public num;
    address public sender;
    uint public value;

    function setVars(address _test, uint _num) external payable {

        // One way //

        // _test.delegateCall(abi.encodeWithSignature("setVars(uint256)", _num))

        // Another way //

        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num));

        require(success, 'delegate call failed!');
    }

}   