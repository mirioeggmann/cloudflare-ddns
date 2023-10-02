FROM alpine:3.18.4
RUN apk add --no-cache bash curl
COPY cloudflare-ddns.sh /
RUN chmod +x /cloudflare-ddns.sh
ENTRYPOINT ["/cloudflare-ddns.sh"]
