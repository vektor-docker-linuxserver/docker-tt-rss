FROM vektory79/i386-baseimage-apache

MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>

# set install packages as variable
ENV APTLIST="git-core php-apcu php-gd php-json php-mysqlnd php-pgsql php-mbstring php-xml"

# install packages
RUN apt-get update && \
apt-get install \
$APTLIST -qy && \

# cleanup 
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add some files 
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/ 
ADD cron/update.sh /usr/local/bin/
ADD cron/tt-rss /etc/cron.d/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh && \
chmod 600 /etc/cron.d/tt-rss

# expose ports
EXPOSE 80 443

# set volumes
VOLUME /config
