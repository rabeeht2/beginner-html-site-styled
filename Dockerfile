FROM ubuntu

RUN apt update && apt install -y apache2

WORKDIR /var/www/html

COPY . /var/www/html

RUN sed -i 's/Listen 80/Listen 99/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:99>/' /etc/apache2/sites-available/000-default.conf
    
EXPOSE 99

CMD ["apache2ctl", "-D", "FOREGROUND"]
