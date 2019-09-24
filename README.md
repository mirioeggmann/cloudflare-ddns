# Cloudflare DDNS
A simple kubernetes cronjob that runs every 5 minutes to check & update the exernal ip.

## Values for k8s-cronjob.yaml

- Get the ZONE_ID under dash.cloudflare.com -> Your domain -> Overview -> API -> Zone ID
```
#example
ZONE_ID                      = 023e105f4ecef8ad9ca31a8372d0c353
```

- Get the RECORD_ID: https://api.cloudflare.com/#dns-records-for-a-zone-list-dns-records
```
#example
RECORD_ID                    = 372e67954025e0ba6aaa6d586b9e0b59
```

- Get your AUTH_KEY (Create a key with "DNS Edit" permissions): https://support.cloudflare.com/hc/en-us/articles/200167836-Where-do-I-find-my-Cloudflare-API-key-
```
#example
AUTH_KEY                     = c2547eb745049flc9320b638f5e225cf483cc5cfdda41
```

- Specify your domain
```
#example
NAME                         = example.com
```

## Execute kubernetes cronjob
```
kubectl apply -f k8s-cronjob.yaml
```

## Future work
```
# TODO automate this command in Github Actions
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t mirioeggmann/cloudflare-ddns:latest --push .
```

[Cloudflare API documentation v4](https://api.cloudflare.com/)
