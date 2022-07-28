#!/bin/bash

# start l1_geth
function startHardhatL1(){
    docker run --net bridge -itd -p 9545:8545 --name=l1_geth davionlabs/hardhat
}

startHardhatL1
