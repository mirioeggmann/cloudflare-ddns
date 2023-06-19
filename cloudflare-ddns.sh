#!/bin/bash

set -eu

if [[ "${DEBUG:-}" == "true" ]]; then # permit debugging
  echo "Debug mode is on, this will expose secrets on stderr" 1>&2
  set -x
fi

# The -v test determines if a variable is set, even if empty. (Bash 4.3+)
if [[ ! -v AUTH_HEADERS ]]; then
  if [[ -v API_TOKEN ]]; then # API_TOKEN is set, prefer to use it
    echo "Using API_TOKEN for authentication" 1>&2
    AUTH_HEADERS=(-H "Authorization: Bearer $API_TOKEN")
  elif [[ -v AUTH_EMAIL && -v AUTH_KEY ]]; then
    echo "Using AUTH_EMAIL/AUTH_KEY for authentication" 1>&2
    AUTH_HEADERS=(-H "X-Auth-Email: $AUTH_EMAIL" -H "X-Auth-Key: $AUTH_KEY")
  else
    echo "Neither API_TOKEN nor AUTH_EMAIL and AUTH_KEY were provided, failing" 1>&2
    exit 1
  fi
fi

: "${IP:=$(curl ifconfig.co)}"
: "${PROXIED:=false}"
echo "Using IP: $IP" 1>&2

PAYLOAD="{\"type\":\"A\",\"name\":\"$NAME\",\"content\":\"$IP\",\"proxied\":$PROXIED,\"ttl\":1}"
echo "Sending payload: $PAYLOAD" 1>&2

# Assemble the whole command into an array, then execute.
COMMAND=(
  curl
  -X PUT
  "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID"
  "${AUTH_HEADERS[@]}"
  -H "Content-Type: application/json"
  --data "$PAYLOAD"
)

"${COMMAND[@]}"
echo # end with line break
