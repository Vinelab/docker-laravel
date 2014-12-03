FROM vinelab/base

MAINTAINER Abed Halawi <abed.halawi@vinelab.com>

RUN yum install -y yum-utils

# Add and enable remi repo
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum-config-manager --enable remi,remi-php56
# Install PHP
RUN yum install -y php php-pdo php-mbstring php-mcrypt php-gd php-fpm
# Install Nginx
RUN yum -y install http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
RUN yum install -y nginx

# setup and run php-fpm
ADD fpm/php-fpm.conf /etc/php-fpm.conf
ADD fpm/site.conf /etc/php-fpm.d/site.conf
ADD fpm/php-fpm.ini /etc/supervisord.d/

# setup nginx
RUN chown -R nginx:nginx /var/www
ADD nginx/php.conf /etc/nginx/php.conf
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default
ADD nginx/app.conf /etc/nginx/conf.d/app.conf
ADD nginx/nginx.conf /etc/nginx/
ADD nginx/nginx.ini /etc/supervisord.d/

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
