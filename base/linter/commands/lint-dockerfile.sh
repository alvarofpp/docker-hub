#!/bin/bash

DIR=${1:-"."}
FILES=$(find-unignored-files "${DIR}" "\\(^\\|.*\\/\\)Dockerfile$")

if [[ -z "${FILES}" ]]; then
  exit 0
fi

echo "${FILES}" | xargs dockerfilelint -c '.lint'
