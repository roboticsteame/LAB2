#!/bin/bash
if [ ! -f ~/.r2d2config ]
  then
    echo "Please run init first!"
    exit
fi
if [ -z "$1" ]; then echo "Use: <ipaddress> <projectName> <Executable>";exit; fi
if [ -z "$2" ]; then echo "Use: <ipaddress> <projectName> <Ececutable>";exit; fi

source ~/.r2d2config
./copyIn.sh $1  /root/Projects/$2/build $PROOT/$2/
./runRemote.sh $1 "cd /root/Projects/$2/build && gdbserver :2222 ./$3"
