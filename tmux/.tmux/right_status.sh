#!/bin/bash

output=""
for iface in $(ip -o link show | awk -F': ' '{print $2}') ; do
    if ip addr show dev $iface | grep -q 'inet ' && ip link show $iface | grep -q 'state UP'; then
        ip=$(ip addr show dev $iface | awk '/inet /{print $2}' | cut -d'/' -f1)
        iface_short=$(echo $iface | cut -c 1-4)
        output+="[$iface_short: $ip] - "
    fi
done

if [ -n "$output" ]; then
    echo "${output::-3}"
else
    echo "[Pas de connexion aux Internets Mondiaux]"
fi
