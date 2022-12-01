from brownie import Overflow, accounts


def main():
    owner = accounts[0]
    attacker = accounts[3]

    overflow = Overflow.deploy({"from": owner})
    breakpoint()

    overflow.getMoney({"from": attacker})
    overflow.addMoney(1, {"from": attacker, "value": 1})

