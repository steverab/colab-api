#!/usr/bin/env bash

Magenta='\033[33;35m';
Reset='\033[0m';

echo "============================="
echo "${Magenta}Truncating current database ...${Reset}"
echo "============================="

heroku pg:reset DATABASE --app colab-api

echo "==================="
echo "${Magenta}Adding migrations ...${Reset}"
echo "==================="

heroku run rake db:migrate

echo "======================="
echo "${Magenta}Pupulating database ...${Reset}"
echo "======================="

heroku run rake db:seed
