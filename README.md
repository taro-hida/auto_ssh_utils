# auto_ssh_utils
You can connect ssh by use this script without inputting pass {word, phrase}. This script input them for you.

## Install this utils

```
cd ~/
git clone https://github.com/taro-hida/auto_ssh_utils.git
echo "alias assh='sh ~/auto_ssh_utils/assh.sh'" >> ~/.bashrc
echo "alias rssh='sh ~/auto_ssh_utils/rssh.sh'" >> ~/.bashrc
```
ofcourse, you can install to another path you prefered to, and set aliases you prefered to.  

and resolve dependencies.   
this "bash_color" script is necessary for colorfull output.   
-> https://github.com/mercuriev/bash_colors  

```
curl https://raw.githubusercontent.com/mercuriev/bash_colors/master/bash_colors.sh > .bash_colors
echo 'source ~/.bash_colors' >> ~/.bashrc
```
finallly, reload .bashrc

```
source ~/.bashrc
```

## get started

first, you create ~/.ssh/config

```
touch ~/.ssh/config
```

now, you set parameter of remote host.  
For example, to connect to server you named "my-ubuntu":   

```
rssh ubuntu@192.168.2.3
Host -> my-ubuntu
port -> [22] 
password ( or passfrase ) -> password
key path -> [] 
password: google
finish register
```
 
when you registe ssh infomation, script connect to the remote_host.  
you have to reinput password or passphrase once, if you don't want to do, press <ctrl+C>  
 
now, you can connect to remote server without password or passphrase.  

```
assh my-ubuntu
```

if you failed to ssh connect, script show list of that host info. 

```
$ assh google-dns    
password: 
failed to connect to 'unknown_host'!!! so list parameters
Host google-dns
HostName 8.8.8.8
User google
Port 22
#google-dnspasswd google
```
 
if you want to connect, recheck parameter.  
 
by the way, you can manage remote_desktop login infomation by use this specification.  
input remote_desktop remote host infomation, and it failed, list parameter.  
 
you only have to copy and paste password:) by use rdp file, you don't have to input  remote host address, username.  
 
