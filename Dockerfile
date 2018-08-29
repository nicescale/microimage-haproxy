from microimages/alpine:3.8

run wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 -O /bin/confd \
  && chmod 755 /bin/confd \
  && apk add -U haproxy iptables

add haproxy.toml /etc/confd/conf.d/haproxy.toml
add haproxy.tmpl /etc/confd/templates/haproxy.tmpl.orig
add haproxy.json /etc/haproxy/
add haproxy.cfg /etc/haproxy/
add demo.pem /etc/haproxy/ssl/
add reload.sh /

add confd_init /etc/cont-init.d/01-confd-onetime
add run_haproxy /etc/services.d/haproxy/run
add run_confd /etc/services.d/confd/run
