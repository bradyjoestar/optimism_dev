#!/bin/bash


function  buildGasOracle() {
  # build l2-geth
  cd optimism/
  docker build -f gas-oracle/Dockerfile -t davionlabs/gas-oracle .
  cd ../
}
