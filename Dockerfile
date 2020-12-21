ARG ARCH=
# FROM ${ARCH}golang:latest
FROM ${ARCH}ubuntu:latest

RUN apt update \
    && apt upgrade -y \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt install golang git -y \
    && go get github.com/bemasher/rtlamr \
    && go get github.com/bemasher/rtlamr-collect \
    && apt install rtl-433 -y \
    && rm -rf ./src

COPY ./start.sh /root/

LABEL description="multi-arch golang image with rtlamr, rtlamr-collect, and rtl-433 included"

#CMD /root/go/bin/rtlamr -server=${RTLTCP_SERVER}:${RTLTCP_PORT} | /root/go/bin/rtlamr-collect
CMD /root/start.sh
