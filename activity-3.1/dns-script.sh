#!bin/bash

network_prefix="$1"
dns_server="$2"

for i in {1..254}; do
    ip="${network_prefix}.${i}"
    result=$(nslookup "$ip" "$dns_server" 2>/dev/null | grep "name =" | cut -d" " -f3 | sed 's/\.$//')
    
    if [ -n "$result" ]; then
        echo "$ip $result"
    fi
done
