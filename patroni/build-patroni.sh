#!/bin/bash

# Create Patroni portable distribution on bare RedHat 7

# Add EPEL repository
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Install PIP, compiller, and development libraries
sudo yum install -y python2-pip gcc postgresql-devel python-devel

# Install virtualenv
sudo pip install virtualenv

# Create Patroni environment and switch into it
virtualenv patroni
. ./patroni/bin/activate

# Build Patroni and pack it
pip install patroni[zookeeper]
tar czf patroni.tgz patroni
