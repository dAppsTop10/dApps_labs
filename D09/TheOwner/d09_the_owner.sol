// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract TheOwner {
    address public owner;
    uint256 public balance = 0;

    function claimOwner() public payable {
        require(msg.value > balance, "Pay more to become the owner");

        // send the previous owner his balance back
        (bool sent, ) = owner.call{value: balance}("");
        require(sent, "Failed to send Ether");

        balance = msg.value;
        owner = msg.sender;
    }
}
