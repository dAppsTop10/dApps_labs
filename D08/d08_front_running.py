from brownie import FrontRunning, accounts, network


def main():
    owner = accounts[0]

    front_running = FrontRunning.deploy("0x4f6465642044696b6c6120526f6d616e", {"from": owner})

    network.disconnect()
