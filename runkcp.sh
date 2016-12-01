#!/bin/bash

while true; do
    pid=`ps -ef|grep server_linux_amd64|grep -v grep|awk '{print $2}'`
	num=1
    if [ -z "$pid" ]; then
		./server_linux_amd64 -l :6565 -t 127.0.0.1:2118 --log /var/log/kcptun.log &
	else
		if [ "$num" ];then
			errorcondition1=`cat /var/log/kcptun.log | grep scavenged`
			errorcondition2=`cat /var/log/kcptun.log | grep exit`
			if [ "$errorcondition1" ];then
				echo $num
				date >> /var/log/kcptun_restart.log
				echo -n "  restarted server" >> /var/log/kcptun_restart
				kill $(ps -ef|grep server_linux_amd64|grep -v grep|awk '{print $2}')
				echo new > /var/log/kcptun.log
			fi
			if [ "$errorcondition2" ];then
				echo $num
				date >> /var/log/kcptun_restart.log
				echo -n "  restarted server" >> /var/log/kcptun_restart
				kill $(ps -ef|grep server_linux_amd64|grep -v grep|awk '{print $2}')
				echo new > /var/log/kcptun.log
			fi
		fi
        sleep 5
    fi
done
