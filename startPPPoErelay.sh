#!/bin/sh
# 2015.Aug.16 by deren@pppoe_relay_mi_mini


testing=$(ps | grep -v grep |grep pppoe-relay)

if [ "$testing" == "" ]; then
	/extdisks/sda1/xiaomi_router/pppoe_relay_mi_mini/pppoe-relay -S eth0.2 -C br-lan
	#ifdown wan
	#ifup wan
	# Fixme : Stop this enhancement may not be a good idea. But this would effect pppoe-relay now.
	/etc/init.d/soft_fast_path off #stop
fi

