FROM alpine:3.10.2
RUN apk add --no-cache curl
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
