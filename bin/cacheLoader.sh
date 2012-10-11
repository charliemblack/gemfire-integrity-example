#!/bin/bash

export TEST_CASE_HOME=`dirname $0`/..

source $TEST_CASE_HOME/bin/setGemFireEnv.sh

java  -DgemfirePropertyFile=$TEST_CASE_HOME/resources/gemfire.properties -Dgemfire.cache-xml-file=$TEST_CASE_HOME/resources/client.xml demo.vmware.gemfire.poc.CacheLoader