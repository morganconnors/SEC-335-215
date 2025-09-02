#!/bin/bash

hostfile=$1
portfile=$2

# File validation
[[ ! -f "$hostfile" ]] && { echo "error: hostfile '$hostfile' not found"; exit 1; }
[[ ! -f "$portfile" ]] && { echo "error: portfile '$portfile' not found"; exit 1; }

echo "host,port"

for host in $(cat $hostfile); do
    for port in $(cat $portfile); do
        timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && echo "$host,$port"
    done
done