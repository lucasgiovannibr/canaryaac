FROM wyveo/nginx-php-fpm:php81

WORKDIR /usr/share/nginx/html

COPY --chown=nginx:nginx . .
