#!/bin/bash

pushd  `pwd` > /dev/null
cd `dirname $0`/..
export TEST_CASE_HOME=`pwd`
popd > /dev/null

# As an alternative you can also set the location of java here.
# export PATH=$PATH:/path/to/java/bin

#export GEMFIRE=/path/to/gemfire

java_version=`java -fullversion 2>&1`

if [[ $java_version != *1.6* && $java_version != *1.7*  ]]; then
    if [ -z "$JAVA_HOME" ]; then
        echo ERROR: Please put java in your path or set JAVA_HOME environment variables to match your environment.  Alternatively you can edit:
        echo "       ${TEST_CASE_HOME}/bin/setGenFireEnv"
        exit 1
    fi
    export PATH=$PATH:$JAVA_HOME/bin
fi

if [ ! -f $GEMFIRE/lib/gemfire.jar ]; then
  echo "ERROR: Could not determine GEMFIRE location.  Did you change JAVA_HOME and GEMFIRE location in setGemFireEnv to match your environment?"
  exit 1
fi

export PATH=$PATH:$GEMFIRE/bin
export CLASSPATH=$GEMFIRE/lib/gemfire.jar:$GEMFIRE/lib/antlr.jar:$TEST_CASE_HOME/data_integrity.jar:$CLASSPATH

