#!/bin/bash

TEST_CASE_HOME=`dirname $0`/..

source $TEST_CASE_HOME/bin/setGemFireEnv.sh


gemfire start-locator -port=55221 -dir=$TEST_CASE_HOME/data/locator -properties=$TEST_CASE_HOME/resources/locator.properties

$TEST_CASE_HOME/bin/startCacheServer.sh 1 &
SERVER1_PID=$!
$TEST_CASE_HOME/bin/startCacheServer.sh 2 &
SERVER2_PID=$!
$TEST_CASE_HOME/bin/startCacheServer.sh 3 &
SERVER3_PID=$!

wait $SERVER1_PID
wait $SERVER2_PID
wait $SERVER3_PID
