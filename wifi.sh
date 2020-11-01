#!/bin/bash

AIRPORT="en0";
WIFI_NETWORK_NAME="xxxxxxxx"
WIFI_PASSWORD="xxxxxxxx"

networksetup -setairportpower $AIRPORT off
networksetup -setairportpower $AIRPORT on
sleep 2

if networksetup -getairportnetwork $AIRPORT | grep -i -a $WIFI_NETWORK_NAME ;
then
    echo 'Connected!';
    exit 0
fi

if networksetup -setairportnetwork $AIRPORT $WIFI_NETWORK_NAME $WIFI_PASSWORD | grep -i -a "Failed" ;
then
    echo 'Failed to connect, just restarting...';
    networksetup -setairportpower $AIRPORT off
    networksetup -setairportpower $AIRPORT on
    sleep 1
fi

networksetup -getairportnetwork $AIRPORT

exit 0;
