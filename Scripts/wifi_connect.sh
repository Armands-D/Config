#!/usr//bin/env bash

nmcli device wifi

echo "Enter SSID:"
read ssid

echo "Enter password"
read -s password
echo "Waiting to connect"

nmcli device wifi connect "${ssid}" password "${password}"

