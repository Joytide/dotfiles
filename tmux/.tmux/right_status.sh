#!/bin/bash

output=""
while read -r ip iface ip_addr; do
    if [ -n "$ip_addr" ]; then
        iface_short=$(echo $iface | cut -c 1-4)
        output+="[$iface_short:${ip_addr%/*}] - "
    fi
done < <(ip -o -4 addr show | awk '{split($2,a,":"); if (a[1] == "lo" || a[1] ~ /^vbox/  || a[1] ~ /^dock/ || a[1] ~ /^br-/) next; print $2, a[1], $4}')
# Tweak as needed for virtual interfaces, currently non-dsiplayed interfaces are: loopback, virtualbox, docker, bridged

if [ -n "$output" ]; then
    echo -n "${output::-3}"
    echo " |"
else
    echo -n "[Pas de connexion aux Internet Mondiaux]"
fi