#!/usr/bin/env python
# Talk with Lenses REST API

import urllib2
import zlib

lenses_addr = '10.0.11.20'
lenses_user = 'admin'
lenses_pass = 'admin'

lenses_url = 'http://%s:9991/api' % lenses_addr

# get response and gunzip it
def gunzip_response(request):
    resp = urllib2.urlopen(request).read()
    return zlib.decompress(resp, 16 + zlib.MAX_WBITS)

req = urllib2.Request(
    lenses_url + '/login',
    '{"user": "%s", "password": "%s"}' % (lenses_user, lenses_pass),
    {
        'Accept-Encoding': 'gzip',
        'Content-Type': 'application/json'
    }
)
token = gunzip_response(req)

req = urllib2.Request(
    lenses_url + '/metadata/topics',
    headers = {
        'Accept-Encoding': 'gzip',
        'X-Kafka-Lenses-Token': token
    }
)
print gunzip_response(req)
