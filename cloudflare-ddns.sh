#!/usr/bin/env bash

curl -X PUT "https://api.cloudflare.com/client/v4/zones/ZONE_ID/dns_records/RECORD_ID" \
     -H "X-Auth-Email: EMAIL" \
     -H "X-Auth-Key: CLOUDFLARE_GLOBAL_API_KEY" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"HOSTNAME\",\"content\":\"`curl ifconfig.co`\"}"
