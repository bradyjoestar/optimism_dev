#!/bin/bash

function buildDtl(){
  cp -r docker/dtl/Dockerfile optimism/Dockerfile
  cd optimism
  docker build -t davionlabs/data-transport-layer .

  #clean the Dockerfile
  rm -rf Dockerfile
}


function replaceEnv(){
  cp -r envs/dtl.template.env envs/dtl.env
}

function startDtl(){
  docker run --net bridge -itd -p 7878:7878 --env-file envs/dtl.env --restart unless-stopped --entrypoint "/opt/optimism/packages/data-transport-layer/dtl.sh" --name=dtl davionlabs/data-transport-layer
}

#
#function startDeployer(){
#  docker run --net bridge -itd   -p 8080:8081 -e "CONTRACTS_RPC_URL=http://172.17.0.1:9545"  -e "CONTRACTS_DEPLOYER_KEY=ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" -e "CONTRACTS_TARGET_NETWORK=local" --entrypoint "/opt/optimism/packages/contracts/deployer.sh"  --name=deployer davionlabs/deployer
#}
#
#buildDeployer
#startDeployer
