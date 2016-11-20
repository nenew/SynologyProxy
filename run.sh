#!/bin/bash
./kcptunclient -r $server_ip:$server_port -l :10000 &
sslocal -s localhost -p 10000 -b 0.0.0.0 -l 6606 -k $server_pw -m $server_methord &
