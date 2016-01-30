#!/usr/bin/env bash

ssh hw cp /var/www/cthulhu_mud/prod/current/db/production.sqlite3 /var/www/cthulhu_mud/prod/current/db/production.sqlite3.`date +%Y-%m-%d.%H:%M:%S`

scp db/development.sqlite3 hw:/var/www/cthulhu_mud/prod/current/db/production.sqlite3