pragma solidity ^0.8.0;

contract CustomModifier {
    
    // By default bool is false
    bool public paused;

    modifier whenNotPaused() {
        require(!paused, 'Contract is paused');
        _;
    }

    function test() public whenNotPaused returns(string memory) {
        return 'Hello';
    }

}