#!/bin/bash

START_DIR="${START_DIR:-/}"

PREFIX="deploy-code-server"

mkdir -p $START_DIR
/entrypoint.sh --bind-addr 0.0.0.0:8090 $START_DIR
