#system and service manager

## Systemd

System and service manager is responsible for controlling how services are started, stopped and otherwise managed on Linux.

To list all running services, systemctl command can be used.

`systemctl`{{execute}}

Activates a service immediately:

`systemctl start foo.service`{{execute}}

Deactivates a service immediately:

`systemctl stop foo.service`{{execute}}


View all logs in journal


`Journalctl`{{execute}}

Use the --since option to show logs after a specified date and time:

`journalctl --since "2020-06-14 04:10:10"`{{execute}}


`Loginctl`{{execute}}

loginctl may be used to introspect and control the state of the system

`loginctl`{{execute}}

systemd-nspawn may be used to run a command or OS in a light-weight namespace container

`Systemd-nspawn`{{execute}}


systemd-analyze - Analyze system boot-up performance  

`systemd-analyze`{{execute}}

systemd-cgls recursively shows the contents of the selected Linux control group hierarchy in a tree

`systemd-cgls`{{execute}}


systemd-cgtop shows the top control groups of the local Linux control group hierarchy, ordered by their CPU, memory, or disk I/O load

`Systemd-cgtop`{{execute}}




