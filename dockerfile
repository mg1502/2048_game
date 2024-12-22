FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y nginx zip curl \
    && apt-get clean

RUN echo "daemon off;" > /etc/nginx/nginx.conf

RUN curl -o /var/www/html/master.zip -L https://github.com/mg1502/2048_game/archive/refs/heads/master.zip

RUN cd /var/www/html/ \
    && unzip master.zip \
    && mv 2048_game-master/* . \
    && rm -rf 2048_game-master master.zip

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
