#!/bin/bash

set -e

echo "Adding Maxwell user."

export MYSQL_PWD="test"

# Add a user for Maxwell and grant it the required permissions.
mysql --user root <<EOSQL
CREATE USER 'maxwell'@'%' IDENTIFIED BY 'test';
GRANT ALL ON maxwell.* TO 'maxwell'@'%';
GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'maxwell'@'%';
EOSQL
