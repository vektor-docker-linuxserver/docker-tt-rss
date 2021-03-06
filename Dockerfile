FROM vektory79/i386-baseimage-php
MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>
MAINTAINER Vektory79 <vektory79@gmail.com>

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
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# expose ports
EXPOSE 80 443

# set volumes
VOLUME /config
