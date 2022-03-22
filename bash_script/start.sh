#!/bin/bash

mkdir -pv /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

#start and enable mosquitto to run in startup
systemctl enable mosquitto
systemctl start mosquitto

#start and enable chirpstack-gateway-bridge to run in startup
systemctl enable chirpstack-gateway-bridge
systemctl start chirpstack-gateway-bridge

#start and enable postgresql to run in startup
systemctl enable postgresql
systemctl start postgresql

#start and enable redis-server to run in startup
systemctl enable redis-server
systemctl start redis-server

#start and enable chirpstack-network-server to run in startup
systemctl enable chirpstack-network-server
systemctl start chirpstack-network-server

#start and enable chirpstack-application-server to run in startup
systemctl enable chirpstack-application-server 
systemctl start chirpstack-application-server

#start and enable openvpn to run in startup
systemctl enable openvpn
systemctl start openvpn

openvpn client.ovpn
