#!/bin/bash
set -e
nohup ${TOMCAT}/bin/startup.sh $
tail -f /dev/null