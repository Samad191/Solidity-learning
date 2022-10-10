pragma solidity ^0.8.0;

contract Array {

    uint[] public nums = [1,2,3];
    uint[3] public numsFixed = [4,5];

    // We can not call push or pop on fixed sized arrays
    function examples() public {
        nums.push(4);
        numsFixed.push(7);
        numsFixed.pop();
        nums[1] = 10;

        // Here we are deleting the zero index of the array
        // by deleting the value the default value of the array will be assigned
        delete nums[0] ;

        // we can push or pop of an array in memory
        uint[] memory a = new uint[] (5); 
        uint[5] memory b;
        a[0] = 10;
    }
}

contract ArrayShift {

    uint[] public arr;

    function example() public {
        arr = [1,2,3];
        delete arr[1]; // [1,0,3]
        // by deleting the array will have the default value
    }

    // if we delete an element the value will be default set
    // we can move all the elements and can pop and the 
    // length of the array will be cut short
    function remove(uint index) public {
        require(index < arr.length, 'index out of bound');
        for(uint i=index; i<arr.length-1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

}

contract ArrayShift2 {

    uint[] public arr;

    // if we want to remove the element at index 3, we swap replace
    // the last element with the desired index i.e 3

    function remove(uint index) public {
        arr[index] = arr[arr.length -1];
        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4];
        remove(1);
    }

}