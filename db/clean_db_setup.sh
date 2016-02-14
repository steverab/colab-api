#!/usr/bin/env bash

Blue='\033[33;34m';
Reset='\033[0m';

echo "============================="
echo "${Blue}Local ...${Reset}"
echo "============================="

sh clean_local_db_setup.sh

echo "==================="
echo "${Blue}Remote ...${Reset}"
echo "==================="

sh clean_remote_db_setup.sh
