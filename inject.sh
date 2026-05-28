#!/bin/bash
set -e
FILE="$1"
[ -z "$FILE" ] && echo "Usage: inject.sh <file>" && exit 1

CSS_FLAT='#demo-banner { position: fixed !important; top: 0 !important; left: 0 !important; right: 0 !important; height: 36px !important; display: flex !important; align-items: center !important; justify-content: center !important; background: hsl(38 92% 95%) !important; color: hsl(38 92% 30%) !important; font-size: 0.75rem !important; font-weight: 600 !important; z-index: 2147483647 !important; border-bottom: 1px solid hsl(var(--border)) !important; box-sizing: border-box !important; pointer-events: auto !important; } body { padding-top: 36px !important; } .auth-overlay, #toastContainer { top: 44px !important; } aside { height: calc(100vh - 36px) !important; } .auth-overlay { display: flex !important; position: fixed; inset: 0; background: hsl(var(--background)); z-index: 2147483646; }'

HTML_PAYLOAD=$'<div id="demo-banner">This is a demo instance. Some functions are disabled. All data will be reset periodically. Use <code id="api-key" style="cursor:pointer; background:rgba(0,0,0,0.1); padding:2px 4px; border-radius:4px;" onclick="navigator.clipboard.writeText(\'Beacon-Api-Key\').then(function(){alert(\'Copied!\')}).catch(function(e){console.error(e)})">Beacon-Api-Key</code> for access.</div>'

HTML_PAYLOAD_SED="${HTML_PAYLOAD//&/\\&}"

sed -i "s|</head>|<style>${CSS_FLAT}</style></head>|gI" "$FILE"
sed -i "s|<body[^>]*>|&${HTML_PAYLOAD_SED}|gI" "$FILE"
