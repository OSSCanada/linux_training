# Networking

## IP config info
- ```hostname``` - command gets and sets your hostname
    - ```hostname``` returns your hostname
    - ```sudo hostname <new_host_name>``` sets your new hostname
- ```ip addr```
- ```route```
- ```ping```
- ```traceroute```
- ```/etc/hosts```


## DNS
Basic: ```/etc/hosts```

Advanced:
- install bind9
- edit ```/etc/bind/named.conf``` files for hosts/zones

## Exercises
1. Display your hostname
2. Change your hostname to "linuxbox"
3. Get your IP address
4. Find your default gateway

## Solutions
```bash
#1
hostname

#2
sudo hostname linuxbox

#3
ip addr

#4 - Method 1
route

#4 - Method 2
ip route
```
