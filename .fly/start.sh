#!/bin/sh

set -ex

if [ -n $MIGRATE_ON_BOOT ]; then
  $(dirname $0)/migrate.sh
fi

# Debug: List what's in the bin directory
ls -la /home/node/app/node_modules/.bin

# Start both frontend and API servers using .bin
node /home/node/app/node_modules/.bin/rw-serve-fe &
node /home/node/app/node_modules/.bin/rw-server api