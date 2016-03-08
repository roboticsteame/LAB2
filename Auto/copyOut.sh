#!/bin/bash
if [ ! -f ~/.r2d2config ]
  then
    echo "Please run init first!"
    exit
fi

source ~/.r2d2config
rsync -avz $2 root@$1:$3

