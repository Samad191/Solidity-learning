    pragma solidity ^0.8.0;

    contract Receiver {

        function getSelector(string calldata _func) external pure returns(bytes4) {
            return bytes4(keccak256(bytes(_func)));
        }

        event Log(bytes data);
        function transfer(address _to, uint _amount) external {
            emit Log(msg.data);
        }

          // function to call
        // 0xa9059cbb

        // first argument here address _to
        // 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4

        // second argument here uint _amount
        // 0000000000000000000000000000000000000000000000000000000000000001

    }