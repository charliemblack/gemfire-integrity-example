#!/bin/bash

if [ $# -lt 1 ]
then
        echo "Usage : $0 server_number"
        exit
fi

source `dirname $0`/setGemFireEnv.sh

case "$1" in

1|2|3)
   rm -f $TEST_CASE_HOME/data/server$1/.cacheserver.ser
   cacheserver start -J-DgemfirePropertyFile=$TEST_CASE_HOME/resources/gemfire.properties cache-xml-file=$TEST_CASE_HOME/resources/server.xml -dir=$TEST_CASE_HOME/data/server$1
    ;;
*)
    echo "Usage : $0 server_number"
    ;;

esac

