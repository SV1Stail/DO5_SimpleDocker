gcc -o serv main.c -lfcgi
sudo cp ./nginx.conf /etc/nginx/nginx.conf
sudo nginx -s reload
spawn-fcgi -p 8080 -n ./serv
