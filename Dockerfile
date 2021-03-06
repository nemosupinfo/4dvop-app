FROM haproxy AS haproxy-4dvop
COPY files/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

FROM ubuntu AS nginx-4dvop
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx git -y
RUN rm -rf /var/www/html
RUN cd /tmp && git clone https://github.com/diranetafen/static-website-example.git
RUN mv /tmp/static-website-example /var/www/html
RUN sed -i 's/80 default_server/8080 default_server/g' /etc/nginx/sites-enabled/default
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]



