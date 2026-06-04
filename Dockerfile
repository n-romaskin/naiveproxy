FROM caddy:2-builder AS builder

# Force rebuild marker - меняй дату/версию при необходимости
# Last forced: 2025-06-04-v3

RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy

FROM caddy:2-alpine

# ←←← Вот это было пропущено!
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80
EXPOSE 443

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
