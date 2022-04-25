#!/bin/bash

python3 setup.py sdist bdist_wheel

twine check dist/*

TWINE_USERNAME="$USER" \
  TWINE_PASSWORD="$PASSWORD" \
  exec twine upload $EXTRA_ARGS dist/*
