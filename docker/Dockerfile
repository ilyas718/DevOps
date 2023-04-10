FROM registry.access.redhat.com/ubi8/ubi:latest
RUN yum install -y httpd
COPY index.html /var/www/html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

