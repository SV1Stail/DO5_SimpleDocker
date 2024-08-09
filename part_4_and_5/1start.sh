export DOCKER_CONTENT_TRUST=1
docker build -t app:v1 .
docker run --name app -d -p 80:81 -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf app:v1
