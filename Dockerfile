# WE Bridge PHP-Unit for Harbormaster-drydock
#
# VERSION 0.0.1

FROM phpunit/phpunit
MAINTAINER Thomas Barthelemy <thomasb@we-bridge.net>

LABEL Description="This image is used byt Harbormaster and Drydock to run PHPUnit for Symfony projects"

# Installing SSH for Vagrant provisioning through Ansible
RUN apt-get update
RUN apt-get install -y sudo python wget

# Postgres requirements
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql-9.3 libpq-dev python-psycopg2

# apache requirements
RUN apt-get install -y apache2

# php requirements
run apt-get install -y php5-cli php5-curl php5-fpm php5-pgsql php5-mysql php5-xdebug php5-intl

# PHP ini
COPY php.ini /usr/local/etc/php/php.ini

# PHP exstension
RUN cp /usr/lib/php5/20131226/pdo_pgsql.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/pdo_pgsql.so

# Adding SSH start script
COPY entrypoint.sh /root/entrypoint.sh
RUN chown root:root /root/entrypoint.sh 
RUN chmod +x /root/entrypoint.sh

##OPEN PORT 22 FOR ENABLING SSH
EXPOSE 22

ENTRYPOINT ["/root/entrypoint.sh"]

