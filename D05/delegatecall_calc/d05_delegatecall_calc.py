from brownie import DelegateExample, MainContract, Contract, accounts, network


def main():
    owner = accounts[0]
    attacker = accounts[1]

    main_contract = MainContract.deploy({"from": owner})
    delegate_contract = DelegateExample.deploy(main_contract, {"from": owner})
    delegate_attack = Contract.from_abi("MainContract", delegate_contract, main_contract.abi)

    print(delegate_attack.add(1, 2, {"from": attacker}))
    print(delegate_attack.add(11, 7, {"from": attacker}))
    print(delegate_attack.add(4, 4, {"from": attacker}))

    network.disconnect()
