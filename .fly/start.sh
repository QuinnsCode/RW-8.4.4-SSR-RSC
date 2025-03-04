#!/bin/sh

set -ex

if [ -n $MIGRATE_ON_BOOT ]; then
  $(dirname $0)/migrate.sh
fi

# Debug: List what's in the bin directory
ls -la /home/node/app/node_modules/.bin
ls -la /home/node/app/node_modules/@redwoodjs/web/dist/cjs/bins/
ls -la /home/node/app/node_modules/@redwoodjs/api-server/dist/

# Start both frontend and API servers using .bin
# node /home/node/app/node_modules/.bin/rw-serve-fe &
# node /home/node/app/node_modules/.bin/rw-server api

# node /home/node/app/node_modules/@redwoodjs/api-server/dist/index.js

# Start the API server for production
node /home/node/app/node_modules/@redwoodjs/api-server/dist/index.js api --port 8911 &

# Start the web server
# You might want to use a CDN or Nginx instead for production scale
node /home/node/app/node_modules/@redwoodjs/api-server/dist/index.js web --port 8910
