#!/bin/bash

set -e
set -o pipefail

template="$(pwd)/fluent.conf"
template_mod="$(pwd)/fluent-mod.conf"

# We cannot change the file directly with `sed` as we'll run into the `device or resource busy` error,
# Therefore let's create a copy, replace the token in the copy and pass the copy as a config file
# See https://unix.stackexchange.com/questions/404189/find-and-sed-string-in-docker-got-error-device-or-resource-busy
cp $template $template_mod

echo "LOGZ_API_TOKEN: ${LOGZ_API_TOKEN}"

# http://steveadams.io/2016/08/18/Environment-Variable-Templates.html
if [ "$LOGZ_API_TOKEN" == "" ]; then
  echo >&2 "[ERROR] Please pass a value for the LOGZ_API_TOKEN environment variable." #> /dev/stderr;
  exit 1;
else
  echo "[INFO] OK, we have an API_TOKEN for LOGZ.";
  sed -i "s/###LOGZ_API_TOKEN###/${LOGZ_API_TOKEN}/g" $template_mod
fi

fluentd -c $template_mod -p /fluentd/plugins
