#!/bin/bash
# set -o errexit
export EOSIO_SYSTEM_CONTRACTS_PUB_KEY="EOS5Rc8VJCyNCYPdE4gQhqPMTetFXkJPagkq4dicPCPGTAr5d4qu8"
export WALLET_KEY_PATH="/eos_wallet_key/key.txt"
export CONTRACTS_PATH="/contracts/v1.6.0/build/contracts"
cleos wallet unlock --password  $(cat ${WALLET_KEY_PATH})
sleep 3
cleos set contract eosio.token ${CONTRACTS_PATH}/eosio.token
sleep 5
cleos set contract eosio.msig ${CONTRACTS_PATH}/eosio.msig
sleep 10
cleos set contract eosio ${CONTRACTS_PATH}/eosio.system
sleep 15
cleos set contract eosio ${CONTRACTS_PATH}/eosio.bios
sleep 15
cleos set contract eosio ${CONTRACTS_PATH}/eosio.wrap
sleep 15
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active
  