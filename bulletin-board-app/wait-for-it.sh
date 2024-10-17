#!/bin/bash
host="$1"
shift
cmd="$@"

until nc -z -v -w30 "$host" 1433
do
  echo "Waiting for database connection..."
  sleep 5
done

exec $cmd
