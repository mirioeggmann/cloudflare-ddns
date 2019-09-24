FROM alpine:3.10.2
RUN apt-get update && apt-get install -y curl
RUN curl ifconfig.co
