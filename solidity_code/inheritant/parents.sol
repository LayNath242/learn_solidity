// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Parent {
    uint data;
    
    constructor(uint init) public {
        data = init;    
    }
    
    function foo() internal {}
}