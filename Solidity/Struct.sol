pragma solidity ^0.8.0;

contract Structs {

    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        // Different was to initialize struct
        Car memory toyota = Car('toyota', 1990, msg.sender);

        // the params here can be interchangeable
        Car memory lambo = Car({ model: 'Lamborghini', year: 1980, owner: msg.sender });

        //initialized with default values
        Car memory tesla;
        tesla.model = 'Tesla';
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car('Ferrari', 2020, msg.sender));

        Car storage _car = cars[0];
        _car.year = 1970;

        // Set to default values
        delete _car.owner;
        delete cars[1];

    }


}