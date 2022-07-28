#!/bin/bash

function buildDeployer(){
  cd optimism
  docker build -f ops/docker/Dockerfile.packages -t davionlabs/test .
}


buildDeployer
