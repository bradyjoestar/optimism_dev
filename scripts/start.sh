#!/bin/bash

function startL1() {
  docker run --net bridge -itd -p 9545:8545 --name=l1_geth ethereumoptimism/hardhat
}

function startDeployer(){
  docker run --net bridge -itd   -p 8080:8081 -e "CONTRACTS_RPC_URL=http://172.17.0.1:9545"  -e "CONTRACTS_DEPLOYER_KEY=ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" -e "CONTRACTS_TARGET_NETWORK=local" --entrypoint "/opt/optimism/packages/contracts/deployer.sh"  --name=deployer ethereumoptimism/deployer
}

function startL2(){
  docker run --net bridge -itd -p 8545:8545 -p 8546:8546 --env-file envs/geth.env --entrypoint "/usr/local/bin/geth.sh" --name=l2_geth ethereumoptimism/l2geth
}

function startDtl(){
  docker run --net bridge -itd -p 7878:7878 --env-file envs/dtl.env --restart unless-stopped --entrypoint "/opt/optimism/packages/data-transport-layer/dtl.sh" --name=dtl ethereumoptimism/data-transport-layer
}

function startGasOracle(){
  docker run --net bridge -itd  -e "GAS_PRICE_ORACLE_ETHEREUM_HTTP_URL=http://172.17.0.1:9545" -e "GAS_PRICE_ORACLE_LAYER_TWO_HTTP_URL=http://172.17.0.1:8545" -e "GAS_PRICE_ORACLE_PRIVATE_KEY=0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba" --name=gas-oracle ethereumoptimism/gas-oracle
}

function startBatchSubmitter(){
  docker run --net bridge -itd --env-file envs/batch-submitter.env --entrypoint "/usr/local/bin/batch-submitter.sh" --name=batch-submitter ethereumoptimism/batch-submitter-service
}

function startVerifier(){
  docker run --net bridge -itd -p 8547:8545 -p 8548:8546 --env-file envs/verifier.env --entrypoint "/usr/local/bin/geth.sh" --name=verifier ethereumoptimism/l2geth
}

function startReplica(){
  docker run --net bridge -itd -p 8549:8545 -p 8550:8546 --env-file envs/replica.env --entrypoint "/usr/local/bin/geth.sh" --name=replica ethereumoptimism/l2geth
}
#
function startReplicaHealth(){
  docker run --net bridge -itd -p 7300:7300 --name=replication_health -e "HEALTHCHECK__REFERENCE_RPC_PROVIDER=http://172.17.0.1:8545" -e "HEALTHCHECK__TARGET_RPC_PROVIDER=http://172.17.0.1:8549" ethereumoptimism/replica-healthcheck
}

function startIntegrationtest(){
  docker run --net bridge -itd --env-file envs/intergration.env --name=intergration_test --entrypoint "/opt/optimism/integration-tests/integration-tests.sh" ethereumoptimism/integration-tests
}

function startLocalL1(){
#  docker run --net bridge -it -v locall1.sh:/locall1.sh -p 8551:8545 --entrypoint "/locall1.sh" ethereum/client-go:v1.10.17
# --entrypoint "/local/locall1.sh"
  sudo rm -rf db
  mkdir db
  docker run --net bridge -it -v $PWD/local/:/local/ -v $PWD/db/:/db/ -v $PWD/genesis:/genesis -p 8551:8545  --entrypoint "/local/locall1.sh" ethereum/client-go:v1.10.17
}

startL1
sleep 5
startDeployer

sleep 5
startL2

sleep 30
startDtl

sleep 10
startGasOracle

sleep 10
startBatchSubmitter

startVerifier

startReplica

startReplicaHealth

sleep 60
startIntegrationtest

startLocalL1

#docker logs -f deployer --tail=1000
