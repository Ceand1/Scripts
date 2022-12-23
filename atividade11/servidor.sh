#!/bin/bash


faucet 8080 --in --fd 3 sh -c "tee ip.txt ; sockdown 3" 

#sockdown 1 2 
#hose 192.168.1.10 8080 --out sh -c "cat caraio.txt"

