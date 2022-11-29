#!/bin/bash

set -ex

envsubst < /app/src/backend.conf.temp > /app/src/backend.conf

/app/src/wait-for-it.sh database:3306
exec /app/.local/bin/gunicorn wsgi:app -b 0.0.0.0:8000
