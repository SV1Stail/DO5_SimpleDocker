rm -rf serv
gcc -o serv main.c -lfcgi
spawn-fcgi -p 8080 -n ./serv
