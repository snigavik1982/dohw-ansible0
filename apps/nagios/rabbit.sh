#!/bin/bash

QUEUE_LENGTH=`/usr/sbin/rabbitmqctl list_queues name messages_ready messages | grep urbunny | awk '{print $2}'`
echo $QUEUE_LENGTH

if [ 100 -gt $QUEUE_LENGTH ]; then
	echo "OK- $QUEUE_LENGTH"
	exit 0
elif [ $QUEUE_LENGTH -et 0 ]; then
	echo "WARNING- $QUEUE_LENGTH"
	exit 1
elif [ $QUEUE_LENGTH -gt 100 ]; then
	echo "CRITICAL- $QUEUE_LENGTH"
	exit 2
else "UNKNOWN- $QUEUE_LENGTH"
exit 3
fi
