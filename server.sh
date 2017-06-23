#!/bin/bash
echo "$# arguments"
if [ $# -ne 2 ]; then 
  echo "Error: server address"
  echo "Example: bash $0 tokyo.sunpi.co"
	exit -1
fi

export SERVERNAME="$1"

echo "New server: SERVERNAME=$1"

docker-compose run --rm openvpn ovpn_genconfig -u udp://$SERVERNAME
docker-compose run --rm openvpn ovpn_initpki

# Fix ownership (depending on how to handle your backups, this may not be needed)
sudo chown -R $(whoami): ./openvpn-data

# Start OpenVPN server process
docker-compose up -d openvpn

echo "Complete"
