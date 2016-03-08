#!/bin/bash
if [ ! -f ~/.r2d2config ]
  then
    echo "Please run init first!"
    exit
fi
if [ -z "$1" ]; then echo "Use: <ipaddress> <projectName> <Executable>";exit; fi
if [ -z "$2" ]; then echo "Use: <ipaddress> <projectName> <Ececutable>";exit; fi

source ~/.r2d2config
./copyOut.sh $1 $PROOT/$2 /root/Projects/
./runRemote.sh $1 "modprobe bcm2835-v4l2"
./runRemote.sh $1 "cvlc v4l2:///dev/video0 --v4l2-width 1920 --v4l2-height 1080 --v4l2-chroma h264 --sout '#standard{access=http,mux=ts,dst=0.0.0.0:12345}'"

