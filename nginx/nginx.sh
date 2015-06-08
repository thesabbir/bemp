#!/bin/bash

echo -e "Configuring nginx..."

echo -e "\nBacking up /usr/local/etc/nginx to nginx.pre"
cp -r /usr/local/etc/nginx /usr/local/etc/nginx.pre

mkdir -p /usr/local/etc/nginx/logs
mkdir -p /usr/local/etc/nginx/sites-available
mkdir -p /usr/local/etc/nginx/sites-enabled
mkdir -p /usr/local/etc/nginx/conf.d

sudo mkdir -p /var/www
sudo chown :staff /var/www
sudo chmod 775 /var/www

cp -r www/* /var/www/

cp nginx.conf /usr/local/etc/nginx/nginx.conf
cp php-fpm.conf /usr/local/etc/nginx/conf.d/php-fpm.conf

cp default.conf /usr/local/etc/nginx/sites-available/default.conf
ln -sfv /usr/local/etc/nginx/sites-available/default.conf /usr/local/etc/nginx/sites-enabled/default.conf

# See #4
ulimit -n 1024

echo -e "\nTesting nginx configuration"
sudo nginx -t

echo -e "\nRestrating nginx"
sudo nginx -s stop
sudo nginx

echo -e "Nginx is now configured with php-fpm.\n"
echo "Visit http://localhost in your browser."
