FROM alpine
WORKDIR /var/www/html

# Install packages
RUN export phpver=$(apk search --no-cache php | awk -F- '/^php(..)-[0-9]/ {print $1}' |tail -n 1) && \
		export ver=$(echo $phpver | grep -o "[0-9]\+") && echo $phpver > /phpver.e && echo $ver > /ver.e && \
		apk add --no-cache $phpver $phpver-bcmath $phpver-bz2 $phpver-calendar $phpver-ctype $phpver-curl $phpver-dom $phpver-exif $phpver-fileinfo $phpver-fpm $phpver-ftp $phpver-gd $phpver-gettext $phpver-iconv $phpver-imap $phpver-intl $phpver-json $phpver-ldap $phpver-mbstring $phpver-mysqli $phpver-opcache $phpver-openssl $phpver-pdo $phpver-pdo_mysql $phpver-pdo_sqlite $phpver-pecl-xdebug $phpver-phar $phpver-posix $phpver-session $phpver-simplexml $phpver-sockets $phpver-sodium $phpver-sqlite3 $phpver-tokenizer $phpver-xml $phpver-xmlreader $phpver-xmlwriter $phpver-xsl $phpver-zip bash coreutils curl expect git htop iproute2-ss iputils memcached nano nginx nodejs npm sqlite supervisor tar tmux tzdata yarn

#Copy config 
COPY etc /etc

# Linking import files
RUN export phpver=$(cat /phpver.e) && export ver=$(cat /ver.e) && \
		[ ! -f /usr/bin/php ] && ln -s /usr/bin/$phpver /usr/bin/php; \
		[ ! -f /usr/sbin/php-fpm ] && ln -s /usr/sbin/php-fpm$ver /usr/sbin/php-fpm; \
		[ ! -d /etc/php ] && ln -s /etc/$phpver /etc/php; \
		[ ! -d /var/log/php ] && ln -s /var/log/$phpver /var/log/php; \
		tar xf nps_conf.tar -C /etc/

#Installing composer
RUN	chown -R nobody:nobody /var/www/html /run /var/lib/nginx /var/log/* && \
		mkdir -p /composer && chmod -R 777 /composer && cd /composer && \
		php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
		php composer-setup.php && php -r "unlink('composer-setup.php');" && \
		mv composer.phar /usr/local/bin/composer && \
		rm -rf /composer /phpver.e /ver.e

# Expose the port
EXPOSE 680-699

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
