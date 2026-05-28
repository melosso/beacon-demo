#!/bin/bash

# --- Configuration ---
PROJECT_DIR="/home/docker/beacon-demo"

# --- API Configuration ---
API_ENDPOINT="https://beacon-demo.melosso.com/api/tokens/generate"

ADMIN_URL="https://beacon-demo.melosso.com/api/admin/submissions"
SUBSCRIBE_BASE="https://beacon-demo-api.melosso.com/api/submission"

API_KEY="Beacon-Api-Key"

# Ensure the project directory exists
mkdir -p "$PROJECT_DIR"

# --- 1. Stop Services First (Releases the Mount) ---
echo "[$(date)] Stopping containers to release file locks..."
cd "$PROJECT_DIR" || exit
/usr/bin/docker compose down -v --remove-orphans

# --- 3. Build image (downloads and patches UI from source) ---
echo "[$(date)] Building demo image..."
/usr/bin/docker compose build --pull

# --- 4. Start Services ---
echo "[$(date)] Starting services..."
/usr/bin/docker compose up -d

echo "[$(date)] Waiting 30 seconds for services to spin up..."
for i in {30..1}; do
  echo -ne "Starting API in $i seconds...\r"
  sleep 1
done
echo ""

echo "[$(date)] Generating demo tokens..."

# Bucket 1
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Iamgroot","email":"iamgroot@me.com","permissions":{"marketing":false,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"en","customFields":{"externalId":"7c3e1e3a-6a6a-4c71-9e3e-8a6d8a9f4c21"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Beehive","email":"beehive@acme.nl","permissions":{"marketing":true,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"nl","customFields":{"externalId":"3b9a9c6f-1c2e-4c52-9c45-9b4e2e8a1d77"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Alice","email":"alice@le-pain.fr","permissions":{"marketing":true,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"fr","customFields":{"externalId":"a6f4b0c1-8c55-4f8a-8e6a-2d4d2d8f8f90"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Bob","email":"bob@vag.de","permissions":{"marketing":true,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"de","customFields":{"externalId":"e2a9d8a4-4e61-4a6b-b2a3-6c5d9f1e3a44"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"John Doe","email":"john.doe@example.com","permissions":{"marketing":true,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"en","customFields":{"externalId":"11111111-1111-4111-8111-111111111111"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Jane Smith","email":"jane.smith@example.com","permissions":{"marketing":false,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"en","customFields":{"externalId":"22222222-2222-4222-8222-222222222222"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Max Mustermann","email":"max.mustermann@demo.de","permissions":{"marketing":true,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"de","customFields":{"externalId":"33333333-3333-4333-8333-333333333333"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Erika Mustermann","email":"erika.mustermann@demo.de","permissions":{"marketing":false,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"de","customFields":{"externalId":"44444444-4444-4444-8444-444444444444"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Jean Dupont","email":"jean.dupont@exemple.fr","permissions":{"marketing":true,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"fr","customFields":{"externalId":"55555555-5555-4555-8555-555555555555"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Marie Durand","email":"marie.durand@exemple.fr","permissions":{"marketing":false,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"fr","customFields":{"externalId":"66666666-6666-4666-8666-666666666666"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Jan Jansen","email":"jan.jansen@voorbeeld.nl","permissions":{"marketing":true,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"nl","customFields":{"externalId":"77777777-7777-4777-8777-777777777777"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Piet Devries","email":"piet.devries@voorbeeld.nl","permissions":{"marketing":false,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"nl","customFields":{"externalId":"88888888-8888-4888-8888-888888888888"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Anna Kowalska","email":"anna.kowalska@demo.pl","permissions":{"marketing":true,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"pl","customFields":{"externalId":"99999999-9999-4999-8999-999999999999"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Piotr Nowak","email":"piotr.nowak@demo.pl","permissions":{"marketing":false,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"pl","customFields":{"externalId":"aaaaaaaa-aaaa-4aaa-8aaa-aaaaaaaaaaaa"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Carlos Garcia","email":"carlos.garcia@empresa.es","permissions":{"marketing":true,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"es","customFields":{"externalId":"bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Maria Lopez","email":"maria.lopez@empresa.es","permissions":{"marketing":false,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"es","customFields":{"externalId":"cccccccc-cccc-4ccc-8ccc-cccccccccccc"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Tom Brown","email":"tom.brown@example.com","permissions":{"marketing":true,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"en","customFields":{"externalId":"dddddddd-dddd-4ddd-8ddd-dddddddddddd"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Lisa White","email":"lisa.white@example.com","permissions":{"marketing":false,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"en","customFields":{"externalId":"eeeeeeee-eeee-4eee-8eee-eeeeeeeeeeee"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Paul Mueller","email":"paul.mueller@demo.de","permissions":{"marketing":true,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"de","customFields":{"externalId":"ffffffff-ffff-4fff-8fff-ffffffffffff"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Sophie Martin","email":"sophie.martin@exemple.fr","permissions":{"marketing":false,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"fr","customFields":{"externalId":"12121212-1212-4121-8121-121212121212"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Kees Bakker","email":"kees.bakker@voorbeeld.nl","permissions":{"marketing":true,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"nl","customFields":{"externalId":"34343434-3434-4343-8343-343434343434"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Tomasz Zielinski","email":"tomasz.zielinski@demo.pl","permissions":{"marketing":true,"system_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"pl","customFields":{"externalId":"56565656-5656-4565-8565-565656565656"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q1","name":"Lucia Martinez","email":"lucia.martinez@empresa.es","permissions":{"marketing":false,"system_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"es","customFields":{"externalId":"78787878-7878-4787-8787-787878787878"}}]'

# Bucket 2
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q2","name":"Carlos","email":"carlos@empresa.es","permissions":{"weekly_updates":true,"monthly_updates":false,"annual_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"es","customFields":{"externalId":"9b7d3a1e-1f4a-4f3c-b9b5-7d2b8e6a1c11"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q2","name":"Anna","email":"anna@firma.de","permissions":{"weekly_updates":false,"monthly_updates":true,"annual_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"de","customFields":{"externalId":"c2a6f8b1-3a44-4a8e-8f7c-0a2b9d4e6f22"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q2","name":"Marie","email":"marie@societe.fr","permissions":{"weekly_updates":true,"monthly_updates":true,"annual_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"fr","customFields":{"externalId":"4f9a1d2c-7b55-4d8f-ae1b-6c3f8a9e3d33"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q2","name":"Jan","email":"jan@bedrijf.nl","permissions":{"weekly_updates":false,"monthly_updates":false,"annual_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"nl","customFields":{"externalId":"d8e3b2a9-5c66-4c1b-9f7e-1a4d6b8c4444"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q2","name":"Ewa","email":"ewa@firma.pl","permissions":{"weekly_updates":true,"monthly_updates":false,"annual_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"pl","customFields":{"externalId":"a3c4e9b7-8d77-4a2c-b1e9-5f6a2d8c5555"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q2","name":"Pieter","email":"pieter@company.nl","permissions":{"weekly_updates":false,"monthly_updates":true,"annual_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"nl","customFields":{"externalId":"6b8d1f3a-9e88-4b5c-8a2f-7c4e5d9a6666"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q2","name":"Laura","email":"laura@company.de","permissions":{"weekly_updates":true,"monthly_updates":true,"annual_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"de","customFields":{"externalId":"f1a9b2c3-0a99-4f6d-9b7e-8d5c3a2b7777"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"campaign_eu_q2","name":"Miguel","email":"miguel@empresa.es","permissions":{"weekly_updates":false,"monthly_updates":false,"annual_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"es","customFields":{"externalId":"3c7a5b8d-1faa-4d8a-b9c2-6e4f1d0a8888"}}]'

# Bucket 3
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"system_updates","name":"Systems","email":"systems@heyyou.com","permissions":{"weekly_updates":true,"monthly_updates":false,"annual_updates":true},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"en","customFields":{"externalId":"9b7d3a1e-1f4a-4f3c-b9b5-7d2b8e6a1c11","source":"demo"}}]'
curl -s -X POST "$API_ENDPOINT" -H "X-Api-Key: $API_KEY" -H "Content-Type: application/json" -d '[{"bucket":"system_updates","name":"Administrator","email":"administrator@harz.co.uk","permissions":{"weekly_updates":false,"monthly_updates":true,"annual_updates":false},"allowReplay":true,"expiryDays":1,"skipPermissionUpdate":true,"language":"en","customFields":{"externalId":"4f9a1d2c-3a44-4a8e-8f7c-6e4f1d0a8888","source":"demo"}}]'

echo "Creating newsletter_de form..."

# Create German newsletter form
DE_RESPONSE=$(curl -s -X POST "$ADMIN_URL" \
    -H "X-Api-Key: $API_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "name": "German Newsletter",
        "bucket": "newsletter_de",
        "permission": "Newsletter",
        "collectName": true,
        "allowedOrigins": ["https://beacon-demo-api.melosso.com", "https://beacon-demo.melosso.com", "https://melosso.com"],
        "language": "de",
        "isEnabled": true,
        "formConfig": {
            "title": "Newsletter abonnieren",
            "description": "Erhalten Sie Updates direkt in Ihr Postfach.",
            "buttonText": "Abonnieren",
            "successMessage": "Vielen Dank für Ihre Anmeldung!"
        },
        "disableRedirects": true,
        "customFields": {
            "uniqueId": "{{uuid}}",
            "timestamp": "{{date:Europe/Amsterdam}}",
            "formName": "{{form_name}}",
            "formId": "{{form_id}}",
            "source": "{{source}}"
        }
    }')

DE_FORM_ID=$(echo "$DE_RESPONSE" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)
echo "Created newsletter_de form: $DE_FORM_ID"

# Subscribe 3 emails to newsletter_de
if [[ -n "$DE_FORM_ID" ]]; then
    echo "Subscribing 3 emails to newsletter_de..."
    for contact in "Hans Mueller:hans.mueller@firma.de" "Anna Schmidt:anna.schmidt@firma.de" "Lukas Weber:lukas.weber@unternehmen.eu"; do
        name="${contact%%:*}"
        email="${contact##*:}"
        curl -s -o /dev/null -w "  %{http_code} $email\n" -X POST "$SUBSCRIBE_BASE/$DE_FORM_ID/subscribe" \
            -H "Content-Type: application/json" \
            -H "Origin: https://melosso.com" \
            -d "{\"name\": \"$name\", \"email\": \"$email\", \"consent\": \"true\"}"
    done
fi

echo "Creating newsletter_en form..."

# Create English newsletter form
EN_RESPONSE=$(curl -s -X POST "$ADMIN_URL" \
    -H "X-Api-Key: $API_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "name": "English Newsletter",
        "bucket": "newsletter_en",
        "permission": "Newsletter",
        "collectName": true,
        "allowedOrigins": ["https://beacon-demo-api.melosso.com", "https://beacon-demo.melosso.com", "https://melosso.com"],
        "language": "en",
        "isEnabled": true,
        "formConfig": {
            "title": "Subscribe to our newsletter",
            "description": "Receive updates directly in your inbox.",
            "buttonText": "Subscribe",
            "successMessage": "Thank you for subscribing!"
        },
        "disableRedirects": true,
        "customFields": {
            "uniqueId": "{{uuid}}",
            "timestamp": "{{date:Europe/Amsterdam}}",
            "formName": "{{form_name}}",
            "formId": "{{form_id}}",
            "source": "{{source}}"
        }
    }')

EN_FORM_ID=$(echo "$EN_RESPONSE" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)
echo "Created newsletter_en form: $EN_FORM_ID"

# Subscribe 4 emails to newsletter_en
if [[ -n "$EN_FORM_ID" ]]; then
    echo "Subscribing 4 emails to newsletter_en..."
    for contact in "John Smith:john.smith@company.co.uk" "Emily Jones:emily.jones@business.com" "Oliver Brown:oliver.brown@enterprise.eu" "Sophia Taylor:sophia.taylor@firm.org"; do
        name="${contact%%:*}"
        email="${contact##*:}"
        curl -s -o /dev/null -w "  %{http_code} $email\n" -X POST "$SUBSCRIBE_BASE/$EN_FORM_ID/subscribe" \
            -H "Content-Type: application/json" \
            -H "Origin: https://melosso.com" \
            -d "{\"name\": \"$name\", \"email\": \"$email\", \"consent\": \"true\"}"
    done
fi

if [[ -z "$DE_FORM_ID" || -z "$EN_FORM_ID" ]]; then
  echo "Form creation failed."

  if [[ -z "$DE_FORM_ID" ]]; then
    echo "DE response:"
    echo "$DE_RESPONSE"
  fi

  if [[ -z "$EN_FORM_ID" ]]; then
    echo "EN response:"
    echo "$EN_RESPONSE"
  fi

  exit 1
fi

echo "[$(date)] Reset successful."