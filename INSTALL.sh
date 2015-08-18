#!/bin/sh
# 2015.Aug.16 by deren@pppoe_relay_mi_mini

cp -f /extdisks/sda1/xiaomi_router/pppoe_relay_mi_mini/init.pppoe.relay.sh /etc
chmod 755 /etc/init.pppoe.relay.sh

testing=$(cat /etc/rc.local |grep init.pppoe.relay)
if [ "$testing" == "" ]; then
	sed -i '/exit 0/i\/etc\/init.pppoe.relay.sh &' /etc/rc.local
fi
