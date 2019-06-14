#!/bin/sh

export NODE_NAME=$1
hostnamectl set-hostname $NODE_NAME
echo "127.0.0.1 $NODE_NAME" >> /etc/hosts

cp /vagrant/$NODE_NAME.d/consul.service /lib/systemd/system/
cp /vagrant/consul.hcl /etc/consul.d
cp /vagrant/$NODE_NAME.d/server.hcl /etc/consul.d
systemctl enable consul
systemctl start consul
