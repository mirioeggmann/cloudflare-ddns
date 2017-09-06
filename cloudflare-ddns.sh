#!/usr/bin/env bash

#Examples
#ZONE_ID                      = 023e105f4ecef8ad9ca31a8372d0c353
#RECORD_ID                    = 372e67954025e0ba6aaa6d586b9e0b59
#EMAIL                        = user@example.com
#CLOUDFLARE_GLOBAL_API_KEY    = c2547eb745049flc9320b638f5e225cf483cc5cfdda41
#HOSTNAME                     = example.com

curl -X PUT "https://api.cloudflare.com/client/v4/zones/ZONE_ID/dns_records/RECORD_ID" \
     -H "X-Auth-Email: EMAIL" \
     -H "X-Auth-Key: CLOUDFLARE_GLOBAL_API_KEY" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"HOSTNAME\",\"content\":\"`curl ifconfig.co`\"}"
