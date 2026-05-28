# 🌌 Beacon: Live Demo

[![License](https://img.shields.io/badge/license-AGPL%203.0-blue)](https://github.com/melosso/beacon/blob/main/LICENSE)
[![Last commit](https://img.shields.io/github/last-commit/melosso/beacon)](https://github.com/melosso/beacon/commits/main)
[![Latest Release](https://img.shields.io/github/v/release/melosso/beacon)](https://github.com/melosso/beacon/releases/latest)

Live demo configuration for [beacon-demo.melosso.com](https://beacon-demo.melosso.com). Builds a custom image from `ghcr.io/melosso/beacon:latest` with the demo banner baked in, seeds sample data, and resets hourly via cron. Use `Beacon-Api-Key` as your access token.

![Screenshot of Beacon](https://github.com/melosso/beacon/blob/main/.github/images/screenshot.webp?raw=true)

> See the main [Beacon repository](https://github.com/melosso/beacon) for full documentation, deployment options, and configuration reference.

## Setup

Clone and configure on the server:

```bash
git clone https://github.com/melosso/beacon-demo /home/docker/beacon-demo
cd /home/docker/beacon-demo
chmod +x beacon_demo_manager.sh beacon_env.sh
./beacon_env.sh   # generates .env with signing/encryption keys
```

Run the manager script to build the image and seed demo data:

```bash
./beacon_demo_manager.sh
```

## Automated Reset

Add to root crontab (`sudo crontab -e`) to reset the demo hourly:

```cron
0 * * * * /bin/bash /home/docker/beacon-demo/beacon_demo_manager.sh
```
