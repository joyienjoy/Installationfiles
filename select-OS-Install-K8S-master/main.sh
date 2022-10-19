#!/bin/bash

export VAR=$(cat /usr/lib/os-release | grep "PRETTY_NAME")
echo $VAR
case "$VAR" in
  *Ubuntu*)  ./ubuntu-master.sh ;;
  *CentOS*)  ./centos-master.sh ;;
  *)        echo "unknown: $VAR" ;;
esac
