# Draug

Custom Caddy image with extended functionality.

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
    image: registry.gitlab.com/your-namespace/your-project:draug
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
