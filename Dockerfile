# Apache HTTP Server
#
# VERSION	0.0.1

FROM		ubuntu:latest

MAINTAINER	Simon Vans-Colina

RUN apt-get update

RUN apt-get -y install apache2 git-core

RUN rm -rf /var/www
RUN git clone https://github.com/simonvc/cryptoclass-web.git /var/www
RUN chown -R www-data /var/www
ADD default /etc/apache2/sites-available/default
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
