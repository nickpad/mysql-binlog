#!/bin/bash

set -e

wait-for-it master:3306

mysqlbinlog --read-from-remote-server --host=master --user root -p test --database rep_test