#!/bin/bash

FILES=$(git diff --name-only --diff-filter=ACMRT f41a11d69841bd6fb4ac49156960f1038df5a09c ac2f4ef006719150363c0118332fb6ae75a041b1)
readarray -t FILES_ARRAY <<< "$FILES"
IFS='/'
IMAGES=()

for FILENAME in "${FILES_ARRAY[@]}"; do
  if [[ "$FILENAME" != *"/"* ]]; then
    continue
  fi
  if [[ "$FILENAME" == "."* ]]; then
    continue
  fi
  
  read -a PATHS <<< "$FILENAME"
  DOCKER_IMAGE_NAME="${PATHS[0]}:${PATHS[1]}"
  if [[ " ${IMAGES[@]} " =~ " ${DOCKER_IMAGE_NAME} " ]]; then
    continue
  fi
  
  # docker build "${PATHS[0]}/${PATHS[1]}" -t ${DOCKER_IMAGE_NAME}
  # docker push ${DOCKER_IMAGE_NAME}
  IMAGES+=($DOCKER_IMAGE_NAME)
done

echo ${IMAGES[@]}