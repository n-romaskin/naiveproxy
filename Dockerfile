FROM caddy:2-builder AS builder

# Force rebuild - change this line to force new build
# Last changed: 2025-06-04

RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy

FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80
EXPOSE 443

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
