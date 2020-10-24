ARG ARCH=
FROM ${ARCH}golang:latest

RUN cd /go \
    && go get github.com/bemasher/rtlamr \
    && go get github.com/bemasher/rtlamr-collect \
    && rm -rf ./src

LABEL description="multi-arch golang image with rtlamr and rtlamr-collect included"

CMD rtlamr -s=${RTLTCP_SERVER}:${RTLTCP_PORT} | rtlamr-collect
