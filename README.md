

```bash

docker build -t ddns:latest .
docker create --name "ddns" --restart=always -e DOMAIN="my.cool.domain" -e APIKEY="SECRET\_API\_KEY" ddns:latest
docker start ddns

```