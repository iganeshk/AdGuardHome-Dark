#!/bin/bash

# run AdGuardHome in background
echo "Running AdGuardHome in background"
cd /opt/adwireguard && ./AdGuardHome --no-check-update -c "/opt/adguardhome/conf/AdGuardHome.yaml" -w "/opt/adguardhome/work" -h "0.0.0.0" &

# run wg-easy app using node
echo "Running wg-easy"
cd /opt/adwireguard && exec node server.js
