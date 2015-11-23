#!/bin/sh

echo "Running $0 ($(date))"

echo "proxy=http://PROXY:PORT" >> /etc/yum.conf
echo "proxy_username=USERNAME" >> /etc/yum.conf
echo "proxy_password=PASSWORD" >> /etc/yum.conf

echo "Done running $0 ($(date))"
