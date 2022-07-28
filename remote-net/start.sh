#!/bin/bash
#
#function startL1() {
#  docker run --net bridge -itd -p 9545:8545 --name=l1_geth ethereumoptimism/hardhat
#}



function startDeployer(){
  docker run --net bridge -itd   -p 8080:8081 -e "RINKEBY_ETHERSCAN_API_KEY=B1XAN986315AME96W9QK7X1RGQ6WJMWEPW" -e "CONTRACTS_RPC_URL=https://rinkeby.infura.io/v3/d2e240ec3a474c6b8e7599eabce9fbae" -e "PRIVATE_KEY=6395A7C842A08515961888D21D72F409B61FBCE96AF1E520384E375F301A8297"  -e "CONTRACTS_DEPLOYER_KEY=6395A7C842A08515961888D21D72F409B61FBCE96AF1E520384E375F301A8297" -e "CONTRACTS_TARGET_NETWORK=rinkeby" --entrypoint "/opt/optimism/packages/contracts/deployer.sh"  --name=deployer ethereumoptimism/deployer
}

startDeployer

#docker logs -f deployer --tail=1000
