#!/usr/bin/env bash

Magenta='\033[33;35m';
Reset='\033[0m';

echo "============================="
echo "${Magenta}Truncating current database ...${Reset}"
echo "============================="

rake db:migrate VERSION=0

echo "==================="
echo "${Magenta}Adding migrations ...${Reset}"
echo "==================="

rake db:migrate

echo "======================="
echo "${Magenta}Pupulating database ...${Reset}"
echo "======================="

rake db:seed
