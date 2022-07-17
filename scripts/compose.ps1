docker-compose down
docker-compose rm -f
docker-compose pull
docker-compose build --no-cache
docker-compose up
