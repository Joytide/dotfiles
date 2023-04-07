#!/bin/bash

output=""
for iface in $(ip -o link show | awk -F': ' '{print $2}') ; do
    if [[ $iface == lo* ]]; then
        continue  # skip loopback interface
    fi
    ip_addr=$(ip -o -4 addr show dev $iface | awk '{print $4}')
    if [ -n "$ip_addr" ]; then
        iface_short=$(echo $iface | cut -c 1-6)
        output+="[$iface_short: ${ip_addr%/*}] - "
    fi
done

if [ -n "$output" ]; then
    echo "${output::-3} |"
else
    echo "[Pas de connexion aux Internet Mondiaux]"
fi
