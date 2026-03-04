# Alpine PHP Nginx Stack

Lightweight, dynamic PHP + Nginx development stack built on Alpine
Linux.

This image automatically installs the latest available Alpine PHP
version and configures:

-   PHP-FPM
-   Nginx
-   Supervisor
-   Composer
-   Node.js + NPM + Yarn
-   Xdebug
-   SQLite & MySQL support
-   Memcached
-   Developer utilities (htop, tmux, nano, git)

------------------------------------------------------------------------

## 🚀 Features

-   Auto-detects latest Alpine PHP version
-   PHP-FPM + Nginx managed by Supervisor
-   Composer preinstalled
-   Xdebug included
-   Node.js & Yarn included
-   SQLite + MySQL PDO support
-   Minimal Alpine footprint
-   Suitable for development and internal deployments

------------------------------------------------------------------------

## 🏗 Base Image

-   alpine:latest
-   Nginx (Alpine package)
-   Dynamic PHP version detection via apk search

------------------------------------------------------------------------

## 📦 Installed PHP Extensions

The container installs a full-featured PHP environment including:

bcmath, bz2, calendar, curl, dom, exif, fileinfo, fpm, gd, intl, imap,
ldap, mbstring, mysqli, opcache, openssl, pdo, pdo_mysql, pdo_sqlite,
phar, posix, session, simplexml, sockets, sodium, sqlite3, tokenizer,
xml, xmlreader, xmlwriter, xsl, zip, xdebug

------------------------------------------------------------------------

## 📁 Directory Structure

/var/www/html → Web root\
/etc → Configurations (nginx, php, supervisor)\
/usr/local/bin → Composer

------------------------------------------------------------------------

## 🔌 Exposed Ports

680-699

Bind the desired port when running the container.

------------------------------------------------------------------------

## 🐳 Build

docker build -t alpine-php-nginx-stack .

------------------------------------------------------------------------

## ▶ Run

Basic run:

docker run -p 680:680 alpine-php-nginx-stack

With project volume:

docker run -p 680:680 -v \$(pwd):/var/www/html alpine-php-nginx-stack

------------------------------------------------------------------------

## 🔧 Process Management

Supervisor manages:

-   nginx
-   php-fpm

Startup command:

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf

------------------------------------------------------------------------

## 🧪 Development Environment

This image includes:

-   Xdebug for debugging
-   Composer globally available
-   Node.js and Yarn for frontend builds
-   Git and terminal utilities
-   SQLite for lightweight development databases

------------------------------------------------------------------------

## 🛠 Customization

You can override configuration by mounting your own files:

-   /etc/nginx/nginx.conf
-   /etc/php
-   /etc/supervisor

Or extend this image in another Dockerfile.

------------------------------------------------------------------------

## 📌 Why Alpine?

-   Small image size
-   Faster builds
-   Minimal attack surface
-   Ideal for CI/CD environments

------------------------------------------------------------------------

## 📄 License

MIT License
