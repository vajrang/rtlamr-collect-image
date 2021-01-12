# rtlamr-collect-image

Image for Docker based on golang:latest that includes [rtlamr](https://github.com/bemasher/rtlamr) and [rtlamr-collect](https://github.com/bemasher/rtlamr-collect) and [rtl_433](https://github.com/merbanan/rtl_433)

Supports multi-architecture (currently amd64, arm32, arm64). Build is available [here](hub.docker.com/vajrang/rtlamr-collect).

Requires rtl_tcp to be running on a server:port accessible to this container. Tested to work with [legacycode/rtlsdr](https://hub.docker.com/r/legacycode/rtlsdr).

> `docker run -p 1234:1234 -v /dev/bus/usb legacycode/rtlsdr rtl_tcp -a 0.0.0.0 -p 1234`

## Environment variables:
_rtl_tcp location:_

`RTLTCP_SERVER=192.168.0.7` \
`RTLTCP_PORT=1234`

_[rtlamr](https://github.com/bemasher/rtlamr/wiki/Configuration) settings:_

`RTLAMR_FORMAT=json` _# must be json_ \
`RTLAMR_MSGTYPE=scm,r900` \
`RTLAMR_FILTERID=123456,234567` \
`RTLAMR_DURATION=24h` _# optional_

_[influxdb](https://github.com/bemasher/rtlamr-collect/blob/master/README.md#usage) settings:_

`COLLECT_INFLUXDB_HOSTNAME=http://influxdb:8086/` \
`COLLECT_INFLUXDB_TOKEN=influxdbuser:influxdbpass` \
`COLLECT_INFLUXDB_ORG=org` _# any value for influxdb version < 2.0_ \
`COLLECT_INFLUXDB_BUCKET=database/retention_policy` _# e.g. rtlamr/autogen_ \
`COLLECT_INFLUXDB_MEASUREMENT=rtlamr`

_rtl_433 settings:_

`RTL433_DURATION=5m`\
`RTL433_INFLUXDB=influx://influxdb:8086/`\
`RTL433_INFLUXDB_DATABASE=rtl433`\
`RTL433_DEVICE_PROTOCOLS="-R 9"`

## Build process:

buildx.sh uses docker buildx (experimental) to create a multi-arch docker image. From instructions described [here](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/).
