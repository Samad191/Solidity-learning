pragma solidity ^0.8.0;

contract FallBack {

    event Log(string func, address send, uint value, bytes data);

    // Allows the contract to accept ether directly to the contract
    // like from MetaMask. 
    // fallback function is called when the called function does not exist.
    fallback() external payable {
        emit Log('fallback', msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log('fallback', msg.sender, msg.value, '');
    }   

}



//              Ether sent to the contract
    //                      |
    //             is msg.data empty?
    //             /               \
    //         yes                     no
    //         /                          \
    //     receive exists() ?         fallback()
    //         /               \
    //     yes             no
    //     /                   \
    // receive()           fallback()