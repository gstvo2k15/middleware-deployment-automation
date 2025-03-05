# Use the specified Nginx version from .env
ARG NGINX_VERSION=stable
FROM nginx:${NGINX_VERSION}-alpine

# Set a non-root user for better security
RUN addgroup -g 1000 nginx && adduser -D -G nginx -u 1000 nginx

# Install security tools
RUN apk add --no-cache \
    modsecurity \
    libmodsecurity \
    certbot \
    openssl \
    bash \
    curl

# Copy hardened configurations
COPY nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf/security.conf /etc/nginx/conf.d/security.conf
COPY nginx/conf/hardening.conf /etc/nginx/conf.d/hardening.conf
COPY nginx/conf/logging.conf /etc/nginx/conf.d/logging.conf
COPY nginx/conf/firewall.conf /etc/nginx/conf.d/firewall.conf

# Copy SSL certificates (Replace with your certs or Let's Encrypt setup)
COPY nginx/certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY nginx/certs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

# Set proper permissions
RUN chown -R nginx:nginx /var/log/nginx /var/www /etc/nginx

# Expose ports for HTTP and HTTPS
EXPOSE 80 443

# Run Nginx as non-root
USER nginx

CMD ["nginx", "-g", "daemon off;"]
