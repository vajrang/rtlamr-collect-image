#!/bin/bash

while [ true ]
do
    /root/go/bin/rtlamr -server=${RTLTCP_SERVER}:${RTLTCP_PORT} | /root/go/bin/rtlamr-collect

    rtl_433\
        -d rtl_tcp://${RTLTCP_SERVER}:${RTLTCP_PORT}\
        -C customary\
        ${RTL433_DEVICE_PROTOCOLS}\
        -F ${RTL433_INFLUXDB_LOC}write?db=${RTL433_INFLUXDB_DATABASE}\
        -T ${RTL433_DURATION}
done
