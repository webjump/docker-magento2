#!/bin/sh
for i in $NGINX_SERVER_NAME
do
    export NGINX_SERVER_NAME_AUX=$i
    envsubst '$$PROJECT_ROOT $$NGINX_PORT $$NGINX_SERVER_NAME_AUX' < /etc/nginx/sites/project.conf.template > /etc/nginx/sites/${NGINX_SERVER_NAME_AUX}.conf
done

nginx -g 'daemon off;'
