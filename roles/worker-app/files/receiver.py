#!/usr/bin/env python
import pika
import time

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='central'))
channel = connection.channel()

channel.queue_declare(queue='urbunny', durable=True)
print(' [*] Waiting for messages.')

def callback(ch, method, properties, body):
    print(" [x] Sleeping %r" % body)
    time.sleep(int(body))
    print(" [x] Woke up")
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_qos(prefetch_count=1)
channel.basic_consume(callback,
                      queue='urbunny')

channel.start_consuming()
