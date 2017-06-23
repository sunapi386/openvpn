#!/bin/bash
echo "$# arguments"
if [ $# -ne 1 ]; then 
	echo "illegal number of parameters"
	exit -1
fi

# Generate a client certificate
export CLIENTNAME="`hostname`-$1"

echo "Generating client certificate: " $CLIENTNAME

# with a passphrase (recommended)
docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME
# without a passphrase (not recommended)
# docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME nopass
# Retrieve the client configuration with embedded certificates
docker-compose run --rm openvpn ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn

echo "Complete"
echo "$CLIENTNAME.ovpn"
