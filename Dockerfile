FROM alpine:3.2

RUN apk update && \
    apk add socat && \
    rm -r /var/cache/*

ENTRYPOINT ["socat", "TCP-LISTEN:2375,reuseaddr,fork", "UNIX:/var/run/docker.sock"]
