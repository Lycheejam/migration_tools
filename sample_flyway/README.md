# README

## usage

```sh
$ docker-compose up -d
$ docker exec -it proddb bash
$ docker exec -it devdb bash
$ docker exec -it dlyway bash
```

```sh
root@flyway:/# flyway -configFiles=/flyway-5.2.4/conf/flyway_development.conf  info
Database password:
Flyway Community Edition 5.2.4 by Boxfuse
Database: jdbc:mysql://devdb:3306/sampledb (MySQL 5.7)
Schema version: << Empty Schema >>

+----------+---------+-------------+------+--------------+-------+
| Category | Version | Description | Type | Installed On | State |
+----------+---------+-------------+------+--------------+-------+
| No migrations found                                            |
+----------+---------+-------------+------+--------------+-------+

root@flyway:/# flyway -configFiles=/flyway-5.2.4/conf/flyway_production.conf info
Database password:
Flyway Community Edition 5.2.4 by Boxfuse
Database: jdbc:mysql://proddb:3306/sampledb (MySQL 5.7)
Schema version: << Empty Schema >>

+----------+---------+-------------+------+--------------+-------+
| Category | Version | Description | Type | Installed On | State |
+----------+---------+-------------+------+--------------+-------+
| No migrations found                                            |
+----------+---------+-------------+------+--------------+-------+
```

```sh
root@flyway:/# echo "" | schemalex - "mysql://sampleuser:password@tcp(devdb:3306)/sampledb" > dev.sql
root@flyway:/# echo "" | schemalex - "mysql://sampleuser:password@tcp(proddb:3306)/sampledb" > prod.sql

root@flyway:/# cat dev.sql

BEGIN;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `fuga` (
`foo` BIGINT (20) DEFAULT NULL,
`bar` VARCHAR (50) DEFAULT NULL
) ENGINE = InnoDB, DEFAULT CHARACTER SET = latin1;
CREATE TABLE `hoge` (
`foo` BIGINT (20) NOT NULL,
`bar` VARCHAR (30) DEFAULT NULL,
PRIMARY KEY (`foo`)
) ENGINE = InnoDB, DEFAULT CHARACTER SET = latin1;
CREATE TABLE `hogefuga` (
`foo` BIGINT (20) DEFAULT NULL,
`bar` VARCHAR (50) DEFAULT NULL
) ENGINE = InnoDB, DEFAULT CHARACTER SET = latin1;

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;

root@flyway:/# cat prod.sql

BEGIN;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `fuga` (
`foo` BIGINT (20) DEFAULT NULL,
`bar` VARCHAR (50) DEFAULT NULL,
`foobar` BIGINT (20) DEFAULT NULL
) ENGINE = InnoDB, DEFAULT CHARACTER SET = latin1;
CREATE TABLE `hoge` (
`foo` BIGINT (20) NOT NULL,
`bar` VARCHAR (30) DEFAULT NULL,
`foobar` INT (11) DEFAULT NULL,
PRIMARY KEY (`foo`)
) ENGINE = InnoDB, DEFAULT CHARACTER SET = latin1;

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
```

```sh
root@flyway:/# schemalex dev.sql prod.sql > diff.sql
2020/01/13 12:20:59 failed to parse "from"
BEGIN;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `fuga` (
`foo` BIGINT (20) DEFAULT NULL,
`bar` VARCHAR (50) DEFAULT NULL
) ENGINE = InnoDB, DEFAULT CHARACTER SET = latin1;
CREATE TABLE `hoge` (
`foo` BIGINT (20) NOT NULL,
`bar` VARCHAR (30) DEFAULT NULL,
PRIMARY KEY (`foo`)
) ENGINE = InnoDB, DEFAULT CHARACTER SET = latin1;
CREATE TABLE `hogefuga` (
`foo` BIGINT (20) DEFAULT NULL,
`bar` VARCHAR (50) DEFAULT NULL
) ENGINE = InnoDB, DEFAULT CHARACTER SET = latin1;

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;: parse error: expected CREATE, COMMENT_IDENT, SEMICOLON or EOF at line 2 column 0
    "
" <---- AROUND HERE
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