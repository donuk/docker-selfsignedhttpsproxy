#!/bin/bash -e

CERTFILE=/etc/ssl/self-signed/$DOMAIN/cert.pem
KEYFILE=/etc/ssl/self-signed/$DOMAIN/key.pem

main() {
    [ -f "$CERTFILE" ] || generate_ssl_cert
    generate_nginx_ssl_proxy_conf > /etc/nginx/conf.d/default.conf
}

generate_ssl_cert() {
    mkdir -p $(dirname "$CERTFILE")
    openssl req -subj "/CN=$DOMAIN" -x509 -newkey rsa:4096 -nodes -keyout "$KEYFILE" -out "$CERTFILE" -days 365

}

generate_nginx_ssl_proxy_conf() {
    cat <<EOF
server {
    listen       443 ssl default;
    server_name  "$DOMAIN";

    ssl_certificate $CERTFILE;
    ssl_certificate_key $KEYFILE;

    location / {
        proxy_pass http://$BACKEND;
        proxy_pass_request_headers on;
        proxy_set_header Host \$host;
    }
}
EOF
}

main
