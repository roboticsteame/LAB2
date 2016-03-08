#!/bin/bash 
source config.sh
# This is modified from an external source

#
echo "WARNING: THIS WILL EDIT YOUR SSH CONFIG FILE!"
if [ -z "$2" ]; then echo "Use: <ipaddress or regex> <projectRoot>";exit; fi

# Start with setting up ssh....
if [ ! -f r2d2.rsa  ]
  then 
  echo "Could not find ssh keys. Maybe wrong PWD?"
fi

cp r2d2.rsa $SSHPRV
cp $SSHPATH/config $SSHPATH/r2d2.bak
chmod 600 $SSHPRV

echo "Host $1" >> $SSHPATH/config
echo "IdentityFile $SSHPRV" >> $SSHPATH/config
echo "User root" >> $SSHPATH/config

# Next setup the base folders....
echo "#!/bin/bash" > ~/.r2d2config
echo "" >> ~/.r2d2config
echo "SSHPRV=$SSHPRV" >> ~/.r2d2config
echo "PROOT=$2" >> ~/.r2d2config