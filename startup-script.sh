#!/bin/bash
# Add a route to bypass the VPN
ip route del default
ip route add default via 10.0.0.1 dev eth0

