#!/bin/bash
if [ ! -f ~/.r2d2config ]
  then
    echo "Please run init first!"
    exit
fi
if [ -z "$1" ]; then echo "Use: <ipaddress> <name>";exit; fi
if [ -z "$2" ]; then echo "Use: <ipaddress> <name>";exit; fi

source ~/.r2d2config
./runRemote.sh $1 apt-get update
./runRemote.sh $1 apt-get -y install g++ qt5-qmake rsync gdbserver qt5-default make git libnss-mdns
./runRemote.sh $1 mkdir -p /root/Projects/
./runRemote.sh $1 "echo $2 > /etc/hostname"
./runRemote.sh $1 reboot

