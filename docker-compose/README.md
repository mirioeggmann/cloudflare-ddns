# Usage with docker-compose

This is just a tested suggestion on how to use this project in a non-kubernetes environment (bare docker-compose or portainer).
It's used in conjunction with project [ofelia](https://github.com/mcuadros/ofelia), which is a modern job scheduler implementation written in go.

docker-compose.yaml file look like this:

```
version: "3"
services:
  ofelia:
    image: mcuadros/ofelia:latest
    depends_on:
      - cloudflare-dns
    command: daemon --docker
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
    
  cloudflare-dns:
    image: mirioeggmann/cloudflare-ddns:latest
    labels:
      ofelia.enabled: "true"
      ofelia.job-exec.datecron.schedule: "@every 20m"
      ofelia.job-exec.datecron.command: "/cloudflare-ddns.sh"

    environment:
      PROXIED: $PROXIED
      ZONE_ID: $ZONE_ID
      RECORD_ID: $RECORD_ID
      API_TOKEN: $API_TOKEN
      NAME: $NAME
```
environment variables are set inline, or with an .env file (see documentation for more info)