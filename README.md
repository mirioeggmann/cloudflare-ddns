# Cloudflare DDNS
A kubernetes cronjob that runs a docker-container every 5 minutes to check & update your external ip.

## Execute kubernetes cronjob
```
# 1. Clone the repo
git clone https://github.com/mirioeggmann/cloudflare-ddns.git

# 2. Navigate into it
cd cloudflare-ddns

# 3. Edit the k8s-cronjob.yaml according to "Values for k8s-cronjob.yaml"

# 4. Execute the cronjob
kubectl apply -f k8s-cronjob.yaml
```

## Values for k8s-cronjob.yaml

- Get the RECORD_ID: https://api.cloudflare.com/#dns-records-for-a-zone-list-dns-records
```
#example
RECORD_ID                    = 372e67954025e0ba6aaa6d586b9e0b59
```

- Specify your domain
```
#example
NAME                         = example.com
```
- Get the ZONE_ID under dash.cloudflare.com -> Your domain -> Overview -> API -> Zone ID
```
#example
ZONE_ID                      = 023e105f4ecef8ad9ca31a8372d0c353
```

- There are two options for authentication, AUTH_KEY and AUTH_EMAIL or just API_TOKEN
  if AUTH_EMAIL is defined the first option will execute.
Values for the first option:

- Get your AUTH_KEY (Create a key with "DNS Edit" permissions): https://support.cloudflare.com/hc/en2-us/articles/200167836-Where-do-I-find-my-Cloudflare-API-key-
```
#example
AUTH_KEY                     = c2547eb745049flc9320b638f5e225cf483cc5cfdda41
```
- Specify your cloudflare email
```
#example
AUTH_EMAIL                   = example@example.com
```
Values for the second option:
- Get your API Token My profile -> API Tokens -> Create Tokens -> Edit Zone DNS for the desired zone (https://developers.cloudflare.com/api/tokens/create/): 

#example
API_TOKEN                     = 4525cf483cc5cfd049flc9320b638f5e2c2547eb7da41

For more Cloudflare API informations read the [Cloudflare API documentation v4](https://api.cloudflare.com/)
