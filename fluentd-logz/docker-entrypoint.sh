#!/bin/bash

set -euox pipefail

fluentd --use-v1-config -c $(pwd)/fluent.conf -p /fluentd/plugins
