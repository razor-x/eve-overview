#!/bin/bash

set -e

if [ -z ${TRAVIS} ]; then
  exit 0
fi

if [ "${SKIP_DEPLOY}" = "true" ] && [ "${REQUIRE_KEY}" != "true" ]; then
  exit 0
fi

if [ -z ${DEPLOY_KEY} ] && [ -e '.deploy_key.enc' ]; then
  eval ${1}
fi
