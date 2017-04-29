#!/usr/bin/env python
import pika
import time

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='CENTRAL'))
channel = connection.channel()


channel.queue_declare(queue='urbunny')

def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)
    time.sleep(int(body))
    print(" [+] Unsleep")

channel.basic_consume(callback,
                      queue='urbunny',
                      no_ack=True)

print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()

