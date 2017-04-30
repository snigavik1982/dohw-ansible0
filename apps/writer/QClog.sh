#!/bin/bash

URBUNNYPATH=/opt/urbunny
STRING=$1
NUM=${STRING//[^0-9]/}
if [ ${#NUM} -gt 0 ] && [ $NUM -gt 0 ]; then
    COUNTER=0
    while [ $COUNTER -lt $NUM ]; do
        cd $URBUNNYPATH && /usr/bin/java -cp .:amqp-client-4.0.2.jar:slf4j-api-1.7.21.jar:slf4j-simple-1.7.22.jar Send `shuf -i 10-30 -n 1`
        let COUNTER=COUNTER+1
    done
  else
  echo " Usage: $0 <number of int's to send to queue>"; exit 1
fi