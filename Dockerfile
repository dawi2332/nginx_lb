FROM ubuntu
MAINTAINER dawi2332@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y nginx

ADD confd-0.7.1-linux-amd64 /usr/local/bin/confd
ADD nginx.toml /etc/confd/conf.d/nginx.toml
ADD nginx.tmpl /etc/confd/templates/nginx.tmpl
ADD boot.sh /usr/local/bin/confd-watch

RUN rm -f /etc/nginx/sites-enabled/default

EXPOSE 80

CMD /usr/local/bin/boot.sh
