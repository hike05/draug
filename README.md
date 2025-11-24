# Draug

Custom Caddy image with some extra functionality.

## Plugins

- Forward Proxy (naive)
- Rate Limiting
- Layer 4
- CrowdSec Bouncer
- WAF

## Usage

```yaml
services:
  caddy:
    image: ghcr.io/hike05/draug:draug
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile:ro
    ports:
      - "80:80"
      - "443:443"
```

## Build

```bash
docker build -t draug .
```
