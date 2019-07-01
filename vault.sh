#!/bin/sh

export NODE_NAME=$1
hostnamectl set-hostname $NODE_NAME
echo "127.0.0.1 $NODE_NAME" >> /etc/hosts

cp /vagrant/$NODE_NAME.d/consul.service /lib/systemd/system/
cp /vagrant/$NODE_NAME.d/vault.service /lib/systemd/system/
cp /vagrant/consul.hcl /etc/consul.d
cp /vagrant/$NODE_NAME.d/server.hcl /etc/consul.d
cp /vagrant/$NODE_NAME.d/vault.hcl /etc/vault/vault_server.hcl

echo "export VAULT_ADDR=http://${NODE_NAME}:8200" >> /home/vagrant/.bashrc

systemctl enable consul
systemctl start consul
systemctl enable vault
systemctl start vault
