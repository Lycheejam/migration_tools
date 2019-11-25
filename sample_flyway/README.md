# README

## usage

```sh
$ docker-compose up -d
$ docker exec -it proddb bash
$ docker exec -it devdb bash
$ docker exec -it dlyway bash
```

## hint

* [Docker Documentation \| Docker Documentation](https://docs.docker.com/)
  * Dockerfile
    * [Dockerfile reference \| Docker Documentation](https://docs.docker.com/engine/reference/builder/)
  * docker-compose file
    * [Compose file version 3 reference \| Docker Documentation](https://docs.docker.com/compose/compose-file/)
* mysqlイメージの`/docker-entrypoint-initdb.d`について
  * [mysql \- Docker Hub](https://hub.docker.com/_/mysql#Initializing%20a%20fresh%20instance)
  * Docker hubの「Initializing a fresh instance」セクションを読んで。