#!/bin/bash

while true; do
    pid1=`ps -ef|grep sslocal|grep -v grep|awk '{print $2}'`
	  pid2=`ps -ef|grep kcptunclient|grep -v grep|awk '{print $2}'`
    if [ -z "$pid1" ]; then
		./kcptunclient -r $server_ip:$server_port -l :10000 &
		if [ -z "$pid2" ];then
			sslocal -s localhost -p 10000 -b 0.0.0.0 -l 6606 -k $server_pw -m $server_methord &
		fi
    else
        sleep 60
    fi
done
