#/usr/bin/env bash

apt-get update
apt-get install -y curl
apt-get install -y socat
apt-get install -y apache2

if ! [ -L /var/www ]; then 
	rm -rf /var/www
	ln -fs /vagrant /var/www 
fi

cp /vagrant/consul /usr/local/bin/consul
cp /vagrant/vault /usr/local/bin/vault
mkdir -p /etc/consul.d/{bootstrap,server,client}
mkdir -p /etc/vault
useradd --system --home /etc/consul.d --shell /bin/false consul
useradd --system --home /etc/vault --shell /bin/false vault
mkdir -p /opt/consul
chown consul:consul /opt/consul

