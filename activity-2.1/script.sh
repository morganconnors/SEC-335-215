# Get list of pings

for i in {2..50}; do
    ip="10.0.5.$i"

    if ping -c 1 -W 1 "$ip" >/dev/null 2>&1; then
        echo "$ip is up"
        echo "$ip" >> sweep.txt
    fi
done