# dockle -ak NGINX_GPGKEY app:v1
FROM nginx
WORKDIR /home/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./main.c ./main.c
COPY ./start.sh ./start.sh
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    rm -rf /var/lib/apt/lists/*; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /usr/bin/newgrp; \
    chmod u-s /bin/su; \
    chmod u-s /bin/mount; \
    chmod u-s /bin/umount; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /usr/bin/chfn; \
    chmod u-s /usr/bin/chsh; \
    chmod g-s /usr/bin/expiry; \
    chmod g-s /usr/bin/wall; \
    chmod g-s /sbin/unix_chkpwd; \
    chmod g-s /usr/bin/chage; \
    chmod u-s /usr/bin/passwd
USER nginx
HEALTHCHECK none
CMD ["sh", "./start.sh"]

#docker build -t app:v1 .
#docker run --name app -d -p 80:81 -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf app:v1

