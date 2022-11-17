#!/bin/bash

if [[ -z "${AUTH_EMAIL+x}" ]]; then
echo "AUTH_EMAIL are not defined, will use API Bearer Token method"
curl -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
     -H "Authorization: Bearer $API_TOKEN" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"$NAME\",\"content\":\"`curl ifconfig.co`\",\"proxied\":$PROXIED,\"ttl\":1}"

else
echo "AUTH_EMAIL is defined, will use AUTH_KEY Method"
curl -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
     -H "X-Auth-Email: $AUTH_EMAIL" \
     -H "X-Auth-Key: $AUTH_KEY" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"$NAME\",\"content\":\"`curl ifconfig.co`\",\"proxied\":$PROXIED,\"ttl\":1}"
fi