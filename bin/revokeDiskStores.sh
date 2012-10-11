#!/bin/bash

TEST_CASE_HOME=`dirname $0`/..

source $TEST_CASE_HOME/bin/setGemFireEnv.sh

echo "List of missing disk stores"
gemfire -J-Dgemfire.locators=localhost:55221 list-missing-disk-stores

missing_disk_stores=`gemfire -J-Dgemfire.locators=localhost:55221 list-missing-disk-stores  | grep DiskStore | cut -d " " -f3,4`

if [ "${missing_disk_stores}" != "" ]; then
    missing_files=`echo $missing_disk_stores |  cut -d " " -f2`
    missing_files=`dirname $missing_files`
    if [[ $missing_files == $TEST_CASE_HOME/data* ]] ; then
        rm -rf $missing_files
        mkdir -p $missing_files
    fi
    echo "revoking missing disk store"
    gemfire -J-Dgemfire.locators=localhost:55221 revoke-missing-disk-store $missing_disk_stores
fi

