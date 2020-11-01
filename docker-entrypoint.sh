#!/bin/bash
set -e

if [ "$1" = 'logstash' ]; then
    echo exec gosu logstash "$@"
    exec gosu logstash "$@"
fi

exec "$@"

