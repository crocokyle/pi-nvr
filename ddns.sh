#!/bin/bash

### Google Domains provides an API to update a DNS "Syntheitc record". This script
### updates a record with the script-runner's public IP, as resolved using a DNS
### lookup.
###
### Google Dynamic DNS: https://support.google.com/domains/answer/6147083
### Synthetic Records: https://support.google.com/domains/answer/6069273

USERNAME="Ld4W0QWDTlIwACuC"
PASSWORD="eYNA2d1wbk6cNFdg"
HOSTNAME="@.heavyiron77.com"

# Resolve current public IP
IP=$(curl -s "https://domains.google.com/checkip")
# Update Google DNS Record
URL="https://${USERNAME}:${PASSWORD}@domains.google.com/nic/update?hostname=${HOSTNAME}&myip=${IP}"
curl -s $URL
