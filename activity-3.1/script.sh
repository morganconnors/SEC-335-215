#!bin/bash

prefix = $1
port = $2

echo "host,port"

for i in {1..254}; do
    ip="10.0.5.$i"

    nmap -p $port $ip | grep 53
    
done
