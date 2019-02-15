#!/bin/bash

set -e

echo "Setting up slave instance."

wait-for-it --timeout=120 master:3306

export MYSQL_PWD="test"

echo "Adding Maxwell user."

# Add a user for Maxwell and grant it the required permissions.
mysql --user root <<EOSQL
CREATE USER 'maxwell'@'%' IDENTIFIED BY 'test';
GRANT ALL ON maxwell.* TO 'maxwell'@'%';
GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'maxwell'@'%';
EOSQL

# Get the replication position from the master.
MASTER_STATUS=$(mysql --host=master --user=root --execute='SHOW MASTER STATUS' | tail -n 1)
MASTER_LOG_FILE=$(echo $MASTER_STATUS | awk '{print $1}')
MASTER_LOG_POS=$(echo $MASTER_STATUS | awk '{print $2}')

# Configure this instance as a slave starting from the current master replication position.
mysql --user root <<EOSQL
CHANGE MASTER TO
  MASTER_HOST='master',
  MASTER_USER='root',
  MASTER_PASSWORD='test',
  MASTER_LOG_FILE='$MASTER_LOG_FILE',
  MASTER_LOG_POS=$MASTER_LOG_POS;
EOSQL