FROM alpine:3.22.0
RUN apk add --no-cache bash bind-tools curl
COPY cloudflare-ddns.sh /
RUN chmod +x /cloudflare-ddns.sh
ENTRYPOINT ["/cloudflare-ddns.sh"]
