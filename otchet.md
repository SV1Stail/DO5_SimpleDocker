## Part 1. Готовый докер

- Возьми официальный докер-образ с nginx и выкачай его при помощи docker pull.

<img src="./pictrs/1_1.png" alt="docker pull nginx">

docker pull nginx

- Проверь наличие докер-образа через docker images

<img src="./pictrs/1_2.png" alt="docker images">

docker images

- Запусти докер-образ через docker run -d [image_id|repository].

<img src="./pictrs/1_3.png" alt="docker run -d ">

docker run -d nginx

- Проверь, что образ запустился через docker ps

<img src="./pictrs/1_4.png" alt="docker ps">

docker ps


Посмотри информацию о контейнере через docker inspect [container_id|container_name].

<img src="./pictrs/1_5.png" alt="docker inspect">

docker inspect 4c89b98c9dd5


-По выводу команды определи и помести в отчёт размер контейнера, список замапленных портов и ip контейнера.
* Размер контейнера можно определить по объединению всех слоев в GraphDriver.Data.LowerDir. В данном случае это не указано явно, но известно, что контейнер использует драйвер overlay2 с множеством слоев, которые указаны в поле LowerDir. В данном случае нет информации о размерах слоёв исходя из команды docker inspect 4c89b98c9dd5.

<img src="./pictrs/1_6.png" alt="LowerDir">

LowerDir

<img src="./pictrs/1_6_2.png" alt="shmsize">

shmsize возможно нужный размер

* В поле ExposedPorts указаны порты, которые контейнер выставляет наружу:

<img src="./pictrs/1_7.png" alt="80/tcp">

80/tcp

* В поле IPAddress контейнера указано, что контейнер имеет IP-адрес

<img src="./pictrs/1_8.png" alt="172.17.0.2">

172.17.0.2

- Останови докер образ через docker stop [container_id|container_name].

<img src="./pictrs/1_9.png" alt="docker stop">

docker stop 4c89b98c9dd5

- Проверь, что образ остановился через docker ps

<img src="./pictrs/1_10.png" alt="docker ps2">

docker ps


- Запусти докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run.

<img src="./pictrs/1_11.png" alt="docker run 80:80">

докер с портами 80 и 443

- Проверь, что в браузере по адресу localhost:80 доступна стартовая страница nginx.

<img src="./pictrs/1_12.png" alt="localhost:80">

localhost:80


- Перезапусти докер контейнер через docker restart [container_id|container_name].

<img src="./pictrs/1_13.png" alt="docker restart">

docker restart myNginX

- Проверь любым способом, что контейнер запустился.

<img src="./pictrs/1_14.png" alt=" check restart">

check restart

## Part 2. Операции с контейнером

- Прочитай конфигурационный файл nginx.conf внутри докер контейнера через команду exec.

<img src="./pictrs/2_1.png" alt="docker exec -it myNginX cat /etc/nginx/nginx.conf">

docker exec -it myNginX cat /etc/nginx/nginx.conf

Создай на локальной машине файл nginx.conf.

<img src="./pictrs/2_2.png" alt="nginx.conf">

local nginx.conf

- Настрой в нем по пути /status отдачу страницы статуса сервера nginx.

<img src="./pictrs/2_3.png" alt="status">

/status

- Скопируй созданный файл nginx.conf внутрь докер-образа через команду docker cp.

<img src="./pictrs/2_4.png" alt="docker cp">

docker cp

- Перезапусти nginx внутри докер-образа через команду exec

<img src="./pictrs/2_5.png" alt="restart exec">

docker exec -it myNginX nginx -s reload

- Проверь, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

<img src="./pictrs/2_7.png" alt="localhost:80/status">

localhost:80/status

- Экспортируй контейнер в файл container.tar через команду export.

<img src="./pictrs/2_1.png" alt="export">

docker export -o myNginX_container.tar myNginX

- Останови контейнер.

<img src="./pictrs/2_8.png" alt="docker stop myNginX">

docker stop myNginX

- Удали образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры.

<img src="./pictrs/2_9.png" alt="docker rmi">

docker rmi -f nginx

- Удали остановленный контейнер

<img src="./pictrs/2_10.png" alt="docker rm myNginX">

docker rm myNginX

- Импортируй контейнер обратно через команду import

<img src="./pictrs/2_11.png" alt="docker import ~/Downloads/myNginX_container.tar mynginx">

docker import ~/Downloads/myNginX_container.tar mynginx

- Запусти импортированный контейнер

<img src="./pictrs/2_12.png" alt="docker run -d --name my_new_nginx_container mynginx nginx -g 'daemon off;'">

docker run -d -p 80:80 -p 443:443 --name mynginx_cont  mynginx nginx -g 'daemon off;'

- Проверь, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

<img src="./pictrs/2_13.png" alt="restart">

localhost:80/status
























































