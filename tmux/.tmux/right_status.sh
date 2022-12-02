#!/bin/sh
echo -n "["
[ -d /proc/sys/net/ipv4/conf/wlp4s0 ] && echo -n "wlp4s0: "
[ -d /proc/sys/net/ipv4/conf/wlp4s0 ] && echo -n "$({ ip -4 -br a sh dev wlp4s0 | awk {'print $3'} | cut -f1 -d/; } 2>/dev/null)"
echo -n "] - ["
[ -d /proc/sys/net/ipv4/conf/tun0 ] && echo -n "tun0: "
[ -d /proc/sys/net/ipv4/conf/tun0 ] && echo -n "$({ ip -4 -br a sh dev tun0 | awk {'print $3'} | cut -f1 -d/; } 2>/dev/null)"
echo -n "]"
