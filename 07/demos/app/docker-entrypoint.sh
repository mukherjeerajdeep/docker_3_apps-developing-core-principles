#!/bin/sh

set -e

if [ -n "$NODE_ENV" ] && [ "$NODE_ENV" = 'development' ]; then
    exec npm run dev
fi

exec npm run prod
