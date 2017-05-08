#!/bin/bash

QUEUE_LENGTH=`/usr/sbin/rabbitmqctl list_queues name messages_ready messages | grep urbunny | awk '{print $2}'`

if [ $QUEUE_LENGTH -eq 0 ]; then
        echo "WARNING - queue is empty"
        exit 1
elif [ 30 -gt $QUEUE_LENGTH ] || [ $QUEUE_LENGTH = 30 ]; then
        echo "OK - $QUEUE_LENGTH"
        exit 0
elif [ $QUEUE_LENGTH -gt 30 ]; then
        echo "CRITICAL - $QUEUE_LENGTH"
        exit 2
else echo "UNKNOWN - $QUEUE_LENGTH"
        exit 3
fi
