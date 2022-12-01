// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract MainContract {
    address public owner;

    function setOwner() public {
        owner = msg.sender;
    }

    function doSomething() external { }
}

contract DelegateExample {
    address public owner;
    MainContract public main;

    constructor(MainContract _main) {
        owner = msg.sender;
        main = MainContract(_main);
    }

    fallback() external payable {
        address(main).delegatecall(msg.data);
    }
}
