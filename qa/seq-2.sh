#!/bin/bash

mkdir docker

# build l1-mock-geth'
function buildL1(){
  cp -r optimism/ops/docker/hardhat  docker/
  cd docker/hardhat
  docker build -t davionlabs/hardhat .
  cd ../../
}

# build l2-geth

cd optimism/
docker build -f l2geth/Dockerfile -t davionlabs/l2geth .
cd ../../
