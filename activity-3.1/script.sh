#!bin/bash

prefix=$1
port=$2

echo "inputs"
echo "prefix - $prefix"
echo "port - $port"

echo "host,port,state,service"

for i in {1..254}; do
    ip="10.0.5.$i"

    echo "$ip"
    nmap -p $port $ip | grep 53
    
done
