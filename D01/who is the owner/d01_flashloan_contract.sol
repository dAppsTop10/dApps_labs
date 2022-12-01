// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface IReceiver {
    function receiveTokens(uint256 amount) external;
}

// 100 ether
contract FlashLoan {

    receive() external payable {}

    function flashLoan(uint256 borrowAmount) external {
        require(borrowAmount > 0, "Must borrow at least one token");

        uint256 balanceBefore = address(this).balance;
        require(balanceBefore >= borrowAmount, "Not enough tokens in pool");

        (bool sent, ) = msg.sender.call{value: borrowAmount}("");
        require(sent, "Failed to send Ether");

        // Do something with the money
        IReceiver(msg.sender).receiveTokens(borrowAmount);

        // Pay me back
        uint256 balanceAfter = address(this).balance;
        require(balanceAfter == balanceBefore, "Flash loan hasn't been paid back");
    }

}