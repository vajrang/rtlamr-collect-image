# rtlamr-collect-image

Image for Docker based on golang:latest that includes [rtlamr](https://github.com/bemasher/rtlamr) and [rtlamr-collect](https://github.com/bemasher/rtlamr-collect)

Supports multi-architecture (currently amd64, arm32, arm64). Build is available [here](hub.docker.com/vajrang/rtlamr-collect).

Requires rtl_tcp to be running on a server:port accessible to this container. Tested to work with [legacycode/rtlsdr](https://hub.docker.com/r/legacycode/rtlsdr).

> `docker run -p 1234:1234 -v /dev/bus/usb legacycode/rtlsdr rtl_tcp -a 0.0.0.0 -p 1234`

## Environment variables:
(See [this](https://github.com/bemasher/rtlamr-collect/blob/master/README.md) for more details)

_rtl_tcp location:_

`RTLTCP_SERVER=192.168.0.7`\
`RTLTCP_PORT=1234`

_rtlamr settings:_

`RTLAMR_FORMAT=json` _# must be json_\
`RTLAMR_MSGTYPE=scm,r900`\
`RTLAMR_FILTERID=123456,234567`

_influxdb settings:_

`COLLECT_INFLUXDB_HOSTNAME=http://influxdb:8086/`\
`COLLECT_INFLUXDB_DATABASE=rtlamr`\
`COLLECT_INFLUXDB_USER=dbuser`\
`COLLECT_INFLUXDB_PASS=dbpassword`\
`COLLECT_STRICTIDM=1`

## Build process:

buildx.sh uses docker buildx (experimental) to create a multi-arch docker image. From instructions described [here](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/).
