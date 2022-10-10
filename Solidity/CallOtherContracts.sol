pragma solidity ^0.8.0;

contract CallTestContract {

    // Here we are calling functions from another contract
    // function callAnotheContract(address _contractAddr, uint value) public {
    //     TestContract(_contractAddr).setX(value);
    // }

    ////// OR ///////

    function callAnotheContract(TestContract _contractAddr, uint value) public {
        _contractAddr.setX(value);
    }

     function callAnotheContract2(TestContract _contractAddr) view public returns(uint x) {
        // As the return variable is 'x' it will be returned automatically no
        // no need to add return keyword
        x = _contractAddr.getX();
    }

    function setXAndRecieveEther(TestContract _contractAddr, uint _x) external payable {
        _contractAddr.setXAndRecieveEther{value: msg.value}(_x);
    }

    function getXAndValue(TestContract _contractAddr) view external returns(uint x, uint value) {
       (x, value) =_contractAddr.getXAndValue();
    }

}

contract TestContract {

    uint public x = 10;
    uint public value = 123;

    function setX(uint _x) public {
        x = _x;
    }

    function getX() public view returns(uint) {
        return x;
    }

    function setXAndRecieveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXAndValue() external view returns(uint, uint) {
        return (x, value);
    }

}

/////////////////////////////////////////////////////////////////////////////
////// Another way of calling another contract is throught INTERFACE /////////
/////////////////////////////////////////////////////////////////////////////



interface ICounter{
    function count() external view returns(uint);
    function inc() external; 
}

contract CallInterface {

    uint public count;

    // here we provide the address of the contract and with the help
    // of the interface we call the functions
    function example(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }

}