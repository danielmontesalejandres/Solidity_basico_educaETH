import os
import json
from web3 import Web3
from dotenv import Load_dotenv

Load_dotenv()

with open("artifacts/Saludo_metadata.json") as f:
    info_json = json.load(f)

    ABI = info_json["output"]["abi"]  # primer requisito para la conexion

    CONTRACT = "0xce3e2952F538C4b6e1e303d328Eb50Eb03d747Fb"  # segundo requisito
    WALLET = os.environ["WALLET"]  # tercer requisito
    PRIV_KEY = os.environ["PRIV_KEY"]  # cuarto requisito


    arbitrum_rpc = "https://endpoints.omniatech.io/v1/arbitrum/sepolia/public" # quinto requisito

    w3 = Web3(Web3.HTTPProvider(arbitrum_rpc)) # establecemos la conexion con el RPC

    if w3.isConnected():
        print("-" * 50)
        print("Connected to Arbitrum RPC endpoint")
    else:
        print("Connection Failed")

