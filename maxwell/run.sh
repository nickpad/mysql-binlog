#!/bin/bash

set -e

# First, we need to wait for the master database server to become available
# on port 3306.
wait-for-it master:3306

bin/maxwell --user='maxwell' --password='test' --host='master' --producer='stdout'