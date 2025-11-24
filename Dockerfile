FROM golang:1.24-bullseye AS builder
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

ENV GOTOOLCHAIN=auto
RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy=github.com/klzgrad/forwardproxy@naive \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/mholt/caddy-l4 \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@main \
    --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@main \
    --with github.com/hslatman/caddy-crowdsec-bouncer/appsec@main \
    --with github.com/fabriziosalmi/caddy-waf@main

FROM alpine:3.20
RUN apk add --no-cache ca-certificates
COPY --from=builder /go/caddy /usr/bin/caddy
WORKDIR /srv
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]
