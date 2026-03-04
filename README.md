# Alpine PHP Nginx Stack

Lightweight, dynamic PHP + Nginx development stack built on Alpine Linux.

This image automatically installs the latest available Alpine PHP version and configures:

- PHP-FPM
- Nginx
- Supervisor
- Composer
- Node.js + NPM + Yarn
- Xdebug
- SQLite & MySQL support
- Memcached
- Developer utilities (htop, tmux, nano, git)

---

## 🚀 Features

- Auto-detects latest Alpine PHP version
- PHP-FPM + Nginx managed by Supervisor
- Composer preinstalled
- Xdebug included
- Node.js & Yarn included
- SQLite + MySQL PDO support
- Minimal Alpine footprint
- Suitable for development and internal deployments

---

## 🏗 Base Image

- alpine:latest
- Nginx (Alpine package)
- Dynamic PHP version detection via apk search

---

## 📦 Installed PHP Extensions

The container installs a full-featured PHP environment including:

- bcmath
- bz2
- calendar
- curl
- dom
- exif
- fileinfo
- fpm
- gd
- intl
- imap
- ldap
- mbstring
- mysqli
- opcache
- openssl
- pdo
- pdo_mysql
- pdo_sqlite
- phar
- posix
- session
- simplexml
- sockets
- sodium
- sqlite3
- tokenizer
- xml
- xmlreader
- xmlwriter
- xsl
- zip
- xdebug

---

## 📁 Directory Structure
