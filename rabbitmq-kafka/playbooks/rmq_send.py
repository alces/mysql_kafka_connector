#!/usr/bin/env python

# send a message to RabbitMQ queue
# Usage: $0 queue message

import pika
import sys
import time

if len(sys.argv) < 3:
    sys.stderr.write("Usage: %s queue message\n" % sys.argv[1])
    sys.exit(2)

conn = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
chan = conn.channel()
chan.queue_declare(queue = sys.argv[1])
chan.basic_publish(exchange = '',
                   routing_key = sys.argv[1],
                   body = ' '.join(sys.argv[2:]),
                   properties = pika.BasicProperties(
                       headers = {'ts': int(time.time())}
                   ))
conn.close()

