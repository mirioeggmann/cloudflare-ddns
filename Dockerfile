FROM alpine:3.10.2
RUN apk add --no-cache bash
RUN apk add --no-cache curl
COPY cloudflare-ddns.sh /
RUN chmod +x /cloudflare-ddns.sh
ENTRYPOINT ["/cloudflare-ddns.sh"]
