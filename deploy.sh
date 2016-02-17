#!/usr/bin/env bash

Red='\033[33;31m';
Blue='\033[33;34m';
Reset='\033[0m';

repeat () {
  seq  -f $1 -s '' $2; echo
}

columns=$(tput cols)

repeat "=" $columns
echo "${Blue}Running tests ...${Reset}"
repeat "=" $columns

ruby tests/test.rb

if [ $? -eq 0 ]; then
  repeat "=" $columns
  echo "${Blue}Deploying ...${Reset}"
  repeat "=" $columns

  git push heroku master
else
  repeat "=" $columns
  echo "${Red}Tests failed${Reset}"
  repeat "=" $columns
fi
