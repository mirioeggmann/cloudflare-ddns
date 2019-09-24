FROM alpine:3.10.2
ENV ZONE_ID
RUN apk add --no-cache bash
RUN apk add --no-cache curl
COPY cloudflare-ddns.sh /
RUN chmod +x /cloudflare-ddns.sh
ENTRYPOINT ["/cloudflare-ddns.sh"]
