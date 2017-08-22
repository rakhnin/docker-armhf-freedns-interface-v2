#!/bin/sh

registered=$(nslookup $DOMAIN 8.8.8.8|tail -n2|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')
current=$(wget -q -O - http://checkip-ams.dyndns.com | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')

[ "$current" != "$registered" ] && {
  wget -q -O - "http://sync.afraid.org/u/$APIKEY/"
}
