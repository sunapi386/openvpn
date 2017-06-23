# openvpn
setup a openvpn server

Requires docker, docker-compose. 

1.   clone this repo
2.   have `docker-compose.yml`
3.   run the `bash setup.sh example.com`
4.   make client certificates as needed with `bash client.sh example`
5.   sanity check

# sanity check

```
$ sudo nmap -sU -p 1194 localhost
```

you should see

```
PORT     STATE         SERVICE
1194/udp open|filtered openvpn
```
