#!/bin/bash

URBUNNYPATH=/opt/urbunny
COUNTER=0
while [ $COUNTER -lt $1 ]; do
	cd $URBUNNYPATH && /usr/bin/java -cp .:amqp-client-4.0.2.jar:slf4j-api-1.7.21.jar:slf4j-simple-1.7.22.jar Send `shuf -i 5-15 -n 1`
	let COUNTER=COUNTER+1
done
