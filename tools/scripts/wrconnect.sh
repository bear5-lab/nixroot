#!/usr/bin/env bash

password=""

echo "Please input ip address trying to connect:"
read ip_address

echo "Please input user name:"
read username

read -s -p "Enter password: " password

echo ${password} | sudo openconnect ${ip_address} --protocol=gp --user=${username} --passwd-on-stdin
