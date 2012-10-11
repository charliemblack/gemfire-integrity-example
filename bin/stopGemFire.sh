#!/bin/bash

TEST_CASE_HOME=`dirname $0`/..

source $TEST_CASE_HOME/bin/setGemFireEnv.sh

gemfire -J-Dgemfire.locators=localhost:55221 shut-down-all

gemfire stop-locator -dir=$TEST_CASE_HOME/data/locator -port=55221 -address=127.0.0.1