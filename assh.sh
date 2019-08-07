#!/bin/bash

host=$1
passwd=`grep '	#'$1'passwd' ~/.ssh/config | awk '{print $2}'`
keypass=`grep '	#'$1'keypasswd' ~/.ssh/config | awk '{print $2}'`

list_parameter(){
	grep -A 5 "Host ${host}" ~/.ssh/config
}

printpass(){
	clr_greenb "password: "${passwd}

if [ -n "$keypass" ] ;
then
  clr_greenb "keypass: "${keypass}
fi
}

printpass

ssh ${host}

if test $? -eq 255 
then
	echo 'failed to connect to '$host'!!! so list parameters'
	list_parameter
fi
