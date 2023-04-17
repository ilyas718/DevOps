FROM amazonlinux
RUN yum install -y httpd
COPY index.html /var/www/html
COPY styles.css /var/www/html
CMD ["httpd", "-D", "FOREGROUND"]
