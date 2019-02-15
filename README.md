# MySQL binlog example

This repo provides a minimal config for setting up [Maxwell][1] to read the
[MySQL binlog][2].

This is not intended in any way to be put into production. Instead it's a
starting point for understanding how to configure Maxwell and an easy way of
testing configuration changes.

## Getting started

You'll first need to install Docker if you haven't already.

Docker Compose is used to set up three containers, one acting as the master
database instance, one as a slave and the third running Maxwell connected to the
slave.

To build the containers for the first time, run:

```
docker-compose build
```

You can then start the containers by running:

```
docker-compose up
```

And stop them by running:

```
docker-compose down
```

You can open a `mysql` client on the master using:

```
docker-compose exec master mysql --user root -p
```

And similarly on the slave with:

```
docker-compose exec slave mysql --user root -p
```

[1]: http://maxwells-daemon.io/
[2]: https://dev.mysql.com/doc/refman/8.0/en/binary-log.html

## Understanding the configuration

It'll help to have some familiarity with Docker.

The `docker-compose.yml` file configures three services, `master`, `slave` and
`maxwell`. The containers share a network called `db` so that they can
communicate.

To understand how the containers are configured, look at the files in the
`slave` and `maxwell` directories. There are comments in each file to explain
what's going on.
