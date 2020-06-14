# System and Networking

## System and Networking

### List of open files lsof

lsof commands gives us the list of all open files at that moment.

`lsof`{{execute}}

This command can be combined with grep command to make this search more effective.


### ip


ip command is used to show or manipulate tunnels, routing and devices.This command can be used to assign network address to a network interface or network configuration. It can be used for configuring and editing routing, setting up tunnel, listing ip address and managing ip address or various interfaces or routers. 
some of usage of this command are following

ip address shows list of ip addresses associated with  all network devices

`ip address`{{execute}}

ip link shows the link layer information. It will get the characteristics of the available link layer devices.

`ip link`{{execute}}

### nslookup

nslookup command is used to get information from DNS server. It is a network administration tool for querying DNS Server.

`nslookup google.com`{{execute}}

it will return a record (IP Address)

### Process Status

As Linux allow multiple users and multitasking systems. so it allows multiple processes to operate without interfering with each other.
PS command gives information of currently running processes and their PIDs. 

`ps`{{execute}}

Result contains four columns of information.
Where,
PID – It is the unique process ID within Linux 
TTY – terminal type a user is using
TIME –from how long this process is running
CMD – gives the name of the command which has intiaited this process

to see the all running processes 

`ps -e`{{execute}}

to see all the running processes other then terminal one

`ps -a`{{execute}}

### Super User Do 

sudo command is added in front of the some command as those commands can be run by super user only. sudo gives elevated privileges which allow users to run certain command as administrator.

This command should be used cautiously.

`sudo useradd <username>`{{execute}} This commands can be used to add a user

`sudo passwd <username>`{{execute}} to set password for a new user

`sudo userdel <username>`{{execute}} to delete a user

`sudo usermod -g <groupname> <username> `{{execute}} to added a user to a group.

As this is a powerful command, should be used cautiously.

There are many options available with this command. use man sudo to get more info.

### curl

curl command is used to transfer data to and from a server using any of the supported protocol such as http, ftp, telnet etc. This tool is quite useful in downloading multiple files or libraries or binaries as per need which is required in various places in devops.

when used with option -o it will save a downloaded file on local machine with the name specified as parameter
Let's download openJDK from internet.

`curl -o openJDK.tar.gp https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_linux-x64_bin.tar.gz`{{execute}}


now let's check if the file is indeed downloaded

`ls -l`{{execute}}
