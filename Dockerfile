FROM webandco/ubuntu-supervisor:14.04
MAINTAINER David Spiola <david(at)webandco.com>

ADD root /
RUN /build.sh

WORKDIR /var/www

CMD ["bash"]
ENTRYPOINT ["/config/bootstrap.sh"]


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid


