# Use the specified Nginx version from .env
ARG NGINX_VERSION=stable-alpine3.20-perl

FROM nginx:${NGINX_VERSION}-alpine

# Set a non-root user for better security
RUN addgroup -g 1000 nginx && adduser -D -G nginx -u 1000 nginx

# Install security tools
RUN apk add --no-cache \
    modsecurity \
    libmodsecurity \
    bash \
    curl

# Install dependencies
RUN apk add --no-cache \
autoconf \
automake \
g++ \
gcc \
git \
libtool \
make \
cmake \
musl-dev \
pcre-dev \
zlib-dev \
libxml2-dev \
yajl-dev \
lmdb-dev \
geoip-dev \
doxygen \
curl-dev \
lua-dev \
linux-headers

# Copy hardened configurations
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/security.conf /etc/nginx/conf.d/security.conf
COPY conf/hardening.conf /etc/nginx/conf.d/hardening.conf
COPY conf/logging.conf /etc/nginx/conf.d/logging.conf
COPY conf/firewall.conf /etc/nginx/conf.d/firewall.conf

# Copy SSL certificates only if ENABLE_SSL is set to true
ARG ENABLE_SSL=false
RUN if [ "$ENABLE_SSL" = "true" ]; then \
        mkdir -p /etc/ssl/certs /etc/ssl/private && \
        touch /etc/ssl/certs/nginx-selfsigned.crt && \
        touch /etc/ssl/private/nginx-selfsigned.key; \
    fi

# Ensure necessary directories exist before setting permissions
RUN mkdir -p /var/www /var/log/nginx /etc/nginx \
    && chown -R nginx:nginx /var/log/nginx /var/www /etc/nginx

# Expose ports based on SSL configuration
EXPOSE 80
ARG ENABLE_SSL=false
RUN if [ "$ENABLE_SSL" = "true" ]; then EXPOSE 443; fi

# Run Nginx as non-root
USER nginx

CMD ["nginx", "-g", "daemon off;"]
