#! /usr/bin/env sh
#!/bin/bash
#read LOWERPORT UPPERPORT < /proc/sys/net/ipv4/ip_local_port_range
#echo $LOWERPORT $UPPERPORT
export LOWERPORT=6000
export UPPERPORT=8000
while :
do
        export I2PD_PORT="`shuf -i $LOWERPORT-$UPPERPORT -n 1`"
        ss -lpn | grep -q ":$PORT " || break
done
echo I2PD_PORT=$I2PD_PORT > .port
#--port=$I2PD_PORT
docker run --name=i2pd-docker-icecast --env-file .port \
        -dt -p $I2PD_PORT:$I2PD_PORT/udp \
        -p $I2PD_PORT:$I2PD_PORT \
	i2pd-icecast
