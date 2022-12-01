// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract TheOwner {
    address public owner;
    uint public balance;
    mapping(address => uint) public balances;

    function claimOwner() public payable {
        require(msg.value > balance, "Pay more to become the owner");

        balances[owner] += balance;

        balance = msg.value;
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender != owner, "Current owner cannot withdraw");

        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}
