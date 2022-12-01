from brownie import SmallBank, accounts, network


def main():
    owner = accounts[0]
    user1 = accounts[1]
    user2 = accounts[2]
    attacker = accounts[3]

    smallbank = SmallBank.deploy({"from": owner})

    smallbank.deposit({"from": user1, "value": "5 ether"})
    smallbank.deposit({"from": user2, "value": "5 ether"})

    user1_balance = smallbank.getBalance({"from": user1})
    user2_balance = smallbank.getBalance({"from": user2})

    print(f"smallbank balance: {smallbank.balance()}")

    print(f'user1 wallet balance: {user1_balance}')
    print(f'user2 wallet balance: {user2_balance}')

    network.disconnect()
