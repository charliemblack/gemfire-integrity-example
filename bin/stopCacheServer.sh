#!/bin/bash

if [ $# -lt 1 ]
then
        echo "Usage : $0 server_number"
        exit
fi

TEST_CASE_HOME=`dirname $0`/..

source $TEST_CASE_HOME/bin/setGemFireEnv.sh

case "$1" in

1|2|3)
    if [ -d "$TEST_CASE_HOME/data/server$1" ]; then
        cacheserver stop -dir=$TEST_CASE_HOME/data/server$1
    fi
    ;;
*)
    echo "Usage : $0 server_number"
    ;;

esac