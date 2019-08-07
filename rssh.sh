#!/bin/bash

# parameter
default_password='your_default_password'


#initialised

username=''
hostname=''
Host=''
port=''
password=''
keypath=''
keypass=''

# interactive do
username=`echo $1 | awk -F @ '{print $1}'`
hostname=`echo $1 | awk -F @ '{print $2}'`

echo -n 'Host -> '
read Host
echo -n 'port -> [22] '
read port
if [ -z "$port" ] ; then
  port='22'
fi
echo -n 'password ( or passfrase ) -> '
read password
if [ -z "$password" ] ; then
  password=$default_password
fi
echo -n 'key path -> [] '
read keypath

if [ -n "$keypath" ] ; then
  echo -n 'key pass -> [ something ] '
	read keypass
fi

#~/.ssh/configへの書き込み
echo >> ~/.ssh/config
echo 'Host '$Host >> ~/.ssh/config
echo '	HostName '$hostname >> ~/.ssh/config
echo '	User '$username >> ~/.ssh/config
echo '	Port '$port >> ~/.ssh/config

if [ -z "$keypath" ] ; then
  echo -n
else
  echo '	IdentityFile '$keypath >> ~/.ssh/config
fi

if [ -z "$keypass" ] ; then
  echo -n
else
	echo '	#'$Host'keypasswd '$keypass >> ~/.ssh/config
	echo -e 'keypassword: '$keypass
fi

echo '	#'$Host'passwd '$password >> ~/.ssh/config
echo -e 'password: '$password


echo "finish register"

ssh $Host

