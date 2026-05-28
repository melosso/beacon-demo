#!/bin/bash

# Create the .env file
[ -f .env ] && echo ".env already exists! Aborting." && exit 1; ADMIN_KEY=$(openssl rand -base64 48 | tr -d '\n'); ENC_KEY=$(openssl rand -base64 32); printf "BEACON_SIGNING_KEY=%s\nBEACON_ENCRYPTION_KEY=%s\nBEACON_PEPPER=%s\nBEACON_ADMIN_API_KEY=%s\n" "$(openssl rand -base64 32)" "$ENC_KEY" "$(openssl rand -base64 32)" "$ADMIN_KEY" > .env && echo "Your X-Api-Key is: $ADMIN_KEY"
