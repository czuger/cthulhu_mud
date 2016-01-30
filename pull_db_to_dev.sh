#!/usr/bin/env bash

cp db/production.sqlite3 db/production.sqlite3.`date +%Y-%m-%d.%H:%M:%S`

scp hw:/var/www/cthulhu_mud/prod/current/db/production.sqlite3 db/development.sqlite3