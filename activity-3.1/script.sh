#!bin/bash

prefix=$1
port=$2

echo "inputs"
echo "prefix - $prefix"
echo "port - $port"

echo ""

nmap -oG - -p "$port" "$prefix".0/24 2>/dev/null | awk -v port="$port" '
/open/ {
    split($2, ip_parts, "/")
    ip = ip_parts[1]
    n = split($0, fields, " ")
    for(i=1; i<=n; i++) {
        if(fields[i] ~ port"/open") {
            print ip ":" port
        }
    }
}'
