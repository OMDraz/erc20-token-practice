# https://www.youtube.com/watch?v=M576WGiDBdQ finished at 8:34:49

from brownie import OurToken, network, config
from scripts.helpful_scripts import get_account
from web3 import Web3

INITIALSUPPLY = Web3.toWei(10000000000, "ether")


def deploy_token():
    account = get_account()
    ourtoken = OurToken.deploy(10000000000, {"from": account})
    print("Deployed Token")
    return ourtoken


def main():
    deploy_token()
