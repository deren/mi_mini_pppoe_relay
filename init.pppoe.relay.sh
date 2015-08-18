#!/bin/sh

# copy this file into /etc, and add next line into /etc/rc.local
# /etc/init.sh

INIT_DIR=/extdisks/sda1/xiaomi_router/pppoe_relay_mi_mini

while [ ! -d $INIT_DIR ]
do
	sleep 15
done

$INIT_DIR/startPPPoErelay.sh &
