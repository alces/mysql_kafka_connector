#!/usr/bin/env python

# Read messages from RabbitMQ queue
# Usage: $0 queue

import pika
import sys

if len(sys.argv) < 2:
    sys.stderr.write("Usage: %s queue\n" % sys.argv[1])
    sys.exit(2)

def callback(ch, method, properties, body):
    print("Received: %r (%s)" % (body, properties.headers))

chan = pika.BlockingConnection(pika.ConnectionParameters('localhost')).channel()
chan.queue_declare(queue = sys.argv[1])
chan.basic_consume(callback,
                   queue = sys.argv[1],
                   no_ack = True)

print('Waiting for messages...')
chan.start_consuming()
