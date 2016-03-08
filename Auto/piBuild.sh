#!/bin/bash
if [ ! -f ~/.r2d2config ]
  then
    echo "Please run init first!"
    exit
fi
if [ -z "$1" ]; then echo "Use: <ipaddress> <projectName>";exit; fi
if [ -z "$2" ]; then echo "Use: <ipaddress> <projectName>";exit; fi

source ~/.r2d2config
./copyOut.sh $1 $PROOT/$2 /root/Projects/
./runRemote.sh $1 "cd /root/Projects/$2 && mkdir -p build && cd build && qmake /root/Projects/$2/$2.pro -r -spec linux-g++ CONFIG+=debug CONFIG+=robot && make"

 
