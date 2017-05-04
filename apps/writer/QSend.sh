#!/bin/bash

URBUNNYPATH=/opt/urbunny
STRING=$1
NUM=${STRING//[^0-9]/}
if [ ${#NUM} -gt 0 ] && [ $NUM -gt 0 ]; then
	cd $URBUNNYPATH && /usr/bin/java -cp .:amqp-client-4.0.2.jar:slf4j-api-1.7.21.jar:slf4j-simple-1.7.22.jar Send $NUM
   else
	echo " Usage: $0 <an integer to send to queue>"; exit 1
fi
