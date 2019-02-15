# MySQL binlog example

This repo provides a minimal config for setting up [Maxwell][1] to read the
[MySQL binlog][2].

This is not intended in any way to be put into production. Instead it's a
starting point for understanding how to configure Maxwell and an easy way of
testing configuration changes.

## Getting started

You'll first need to install Docker if you haven't already.

Docker Compose is used to set up two containers, one acting as the master
database instance and the second running Maxwell connected to the master.

To build the master and maxwell containers for the first time, run:

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

The master is mapped to local port 3400, and you can connect to it using
`mysql`:

```
mysql --host 0.0.0.0 --port 3400 --user root -p
```

[1]: http://maxwells-daemon.io/
[2]: https://dev.mysql.com/doc/refman/8.0/en/binary-log.html

## Understanding the configuration

It'll help to have some familiarity with Docker.

The `docker-compose.yml` file configures two services, `master` and `maxwell`.
The two containers share a network called `db` so that they can communicate.

To understand how the `master` and `maxwell` containers are configured, look at
the files in the `master` and `maxwell` directories. There are comments in each
file to explain what's going on.
