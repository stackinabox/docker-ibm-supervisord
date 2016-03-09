#!/bin/sh

# We need to start sshd once to generate the systems fingerprints
# Then in the supervisor conf file start sshd as the foreground process
service sshd start
service sshd stop

echo search xip.io >> /etc/resolv.conf

sleep 10

IFC=$(ifconfig | grep '^[a-z0-9]' | awk '{print $1}' | grep -e ns -e eth0)
IP_ADDRESS=$(ifconfig $IFC | grep 'inet addr' | awk -F : {'print $2'} | awk {'print $1'})
echo "This node has an IP of " $IP_ADDRESS
hostname web.$IP_ADDRESS.xip.io


/usr/bin/supervisord
