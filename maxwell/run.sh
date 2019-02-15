#!/bin/bash

set -e

# First, we need to wait for the master database server to become available on port 3306.
wait-for-it --timeout=120 slave:3306

# Run Maxwell, configured to print each change to STDOUT in JSON format.
bin/maxwell --user="$MAXWELL_USER" --password="$MAXWELL_PASSWORD" --host='slave' --producer='stdout' --ssl='REQUIRED'
