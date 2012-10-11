#!/bin/bash

if [ $# -lt 1 ]
then
        echo "Usage : $0 server_number"
        exit
fi

source `dirname $0`/setGemFireEnv.sh

case "$1" in

1|2|3)
    echo Corrupting server $1 data files

    for file in $TEST_CASE_HOME/data/server$1/*.krf
    do
        printf "\tCorrupting $file\n"
        rm -f $file
        dd if=/dev/zero of=$file bs=1024k count=10
    done
    ;;
*)
    echo "Usage : $0 server_number"
    ;;

esac