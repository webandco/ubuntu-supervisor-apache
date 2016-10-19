#!/bin/bash

set -e
set -u

echo "bootstraping environment..."

if [ "$(ls /config/init/)" ]; then
  for init in /config/init/*.sh; do
    . $init
  done
fi


echo "start supervisor"
/usr/bin/supervisord
