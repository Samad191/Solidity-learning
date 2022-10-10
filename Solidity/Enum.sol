pragma solidity ^0.8.0;

contract Enum {

    enum Status {
        None, Pending, Shipped, Completed, Rejected, Canceled
    }

    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    function get() public view returns(Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        // When deleting the enum it will have the default value which is
        // the first value of the enum
        delete status;
    }

}