#!/bin/bash

# Create Patroni portable distribution on bare RedHat 7

# Install development tools
sudo yum install -y gcc python-devel

# Add EPEL repository
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Install PIP
sudo yum install -y python2-pip

# Install virtualenv
sudo pip install virtualenv

# Add PostgreSQL repository
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Install PostgreSQL development libs
sudo yum install -y postgresql96-devel

# Create Patroni environment and switch into it
virtualenv patroni
. ./patroni/bin/activate

# Build Patroni
export PATH=/usr/pgsql-9.6/bin:$PATH
pip install patroni[zookeeper]

# Make shebang portable
for scr in patroni/bin/*
do
  sed -i -e "1s%`pwd`/patroni/bin/python2%/usr/bin/env python%" $scr
done

# Pack Patroni
tar czf patroni.tgz patroni
