# Cloudflare DDNS

```
get the RECORD_ID: https://api.cloudflare.com/#dns-records-for-a-zone-list-dns-records

# api call doc: https://api.cloudflare.com/#dns-records-for-a-zone-update-dns-record
#Examples
#ZONE_ID                      = 023e105f4ecef8ad9ca31a8372d0c353
#RECORD_ID                    = 372e67954025e0ba6aaa6d586b9e0b59
#AUTH_EMAIL                   = user@example.com
#CLOUDFLARE_GLOBAL_API_KEY    = c2547eb745049flc9320b638f5e225cf483cc5cfdda41
#NAME                         = example.com

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t mirioeggmann/cloudflare-ddns:latest --push .
```
