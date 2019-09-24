FROM alpine:3.10.2
RUN apk add --no-cache curl
RUN curl ifconfig.co
