// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;


contract Overflow {
    uint8 totalBalance;

    function addMoney(uint8 deposit) public payable{
        require(deposit == msg.value, "wrong amount");
        totalBalance += deposit;
    }

    function getMoney() public view returns(uint8){
        return totalBalance;
    }
}
