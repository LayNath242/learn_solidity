// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract A {
    address addreesB;
    
    function setAddress(address contractAddress) external {
        addreesB = contractAddress;
    }
    
    function callHelloWorld() external view returns(string memory) {
        B b = B(addreesB);
        return b.helloWorld();
    }
}

contract B {
    function helloWorld() external pure returns(string memory) {
        return "hello world";
    }
}