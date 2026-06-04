FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy

FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80
EXPOSE 443

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
