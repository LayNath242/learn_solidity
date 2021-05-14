// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "inheritant/parents.sol";


// contract Child is Parent, Parent2, ...
contract Child is Parent {
    // constructor(uint init) public Parent(init) Parent2(), ...
    constructor(uint init) public Parent(init) {}
    
    function bar() external {
        foo();
        data++;
    }
    
    function foobar() external view returns(uint){
        return data;
    }
}