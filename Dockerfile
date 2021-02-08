ARG ARCH=
FROM ${ARCH}golang:latest as builder
RUN apt update \
    && apt upgrade -y \
    && go get github.com/bemasher/rtlamr \
    && go get github.com/bemasher/rtlamr-collect

FROM ${ARCH}ubuntu:latest
RUN apt update \
    && apt upgrade -y \
    && apt install rtl-433 -y
COPY --from=builder /go/bin/rtlamr* /root/go/bin/
COPY ./start.sh /root/

LABEL description="multi-arch rtlamr, rtlamr-collect, and rtl-433 included"

CMD /root/start.sh
