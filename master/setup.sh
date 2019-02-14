#!/bin/bash

set -e

echo "Starting master setup script."

export MYSQL_PWD="test"

mysql --user root <<EOSQL
CREATE USER 'maxwell'@'%' IDENTIFIED BY 'test';
GRANT ALL ON maxwell.* TO 'maxwell'@'%';
GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'maxwell'@'%';
EOSQL
