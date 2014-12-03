# Docker-[ ]-Laravel
Run a [Laravel](http://laravel.com) project using [Docker](http://docker.com).

## Synopsis
This image is based on [vinelab/base](http://github.com/vinelab/docker-base), configured to run a [Laravel](http://laravel.com) project behind [Nginx](http://nginx.com) as a
web server and using [PHP-FPM](http://php.net/manual/en/install.fpm.php), all processes are being watched by a [supervisord](http://supervisord.org) daemon.

## Usage
`docker run -d -p 80:80 -v /path/to/project:/var/www/code vinelab/laravel`

### Configuration
To add or modify configuration you may do so by mounting and overriding any of the files mentioned below:

#### Nginx
* Server Configuration: `/etc/nginx/nginx.conf`
* Host Configuration: `/etc/nginx/conf.d/app.conf` to add more hosts simply mount a *.conf* file to `/etc/nginx/conf.d/`
* PHP Configuration: `/etc/nginx/php.conf`
* Supervisord: `/etc/supervisord.d/nginx.ini

#### PHP
* FPM: `/etc/php-fpm.conf`
* FPM-site specific: `/etc/php-fpm.d/site.conf`
* Supervisord: `/etc/supervisord.d/php-fpm.ini`

### Supervisord
* To add custom programs to supervisord, mount a *.ini* file to `/etc/supervisord.d/` containing program(s) configuration and use `docker exec` to manage `supervisorctl`

* The default credentials for supervisor are `vinelab` `vinelab`

* Supervisord's web interface is running on port `9001` so you may map it with `-p 9001:9001` and see it on the browser
