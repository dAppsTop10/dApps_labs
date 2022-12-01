// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract FrontRunning {
    event success();
    event fail();

    string private password;

    receive() external payable {}

    constructor(string memory _password) payable {
        password = _password;
    }

    function getBalance(string memory _password) external {
        if (keccak256(abi.encodePacked((_password))) == keccak256(abi.encodePacked((password)))) {
            uint256 balance = address(this).balance;
            (bool sent, ) = msg.sender.call{value: balance}("");
            require(sent, "Failed to send Ether");

            emit success();
        } else {

            emit fail();
        }
    }
}