#!/bin/bash

# run AdGuardHome in background
echo "Running AdGuardHome in background"
cd /opt/adwireguard && ./AdGuardHome &

# run wg-easy app using node
echo "Running wg-easy"
cd /opt/adwireguard && exec node server.js
