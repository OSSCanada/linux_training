# Package Management

Fairly straight forward.

In Ubuntu the package manager of choice is Aptitude aka ```apt```.  You may also see and use ```apt-get```, generally ```apt``` and ```apt-get``` are interchangeable.  Stick with ```apt``` as this is the main command going forward.

Caveats:
- To install or grab updates/upgrades with ```apt``` you must run this command with elevated privileges i.e. ```sudo```
- You do not need elevated privileges when searching the ```apt``` catalogue for a package(s)

## Commands
- ```sudo apt install <package_name>``` will install/upgrade to lastest ```<package_name>```
- ```sudo apt remove <package_name>``` will remove/uninstall ```<package_name>```
- ```sudo apt update``` will find all updates for installed apps and newest package versions/repositories but will not install anything
- ```sudo apt upgrade``` will upgrade all installed packages
- ```apt search <term>``` will look up search ```<term>``` for any packages that might include or install keyword ```<term>```
    - Example: ```apt search postgres``` will search all packages for anything that might have ```postgres``` as a key term/function
- ```which <command>``` will find where the command is if it is installed and in the ```$PATH```
- ```<command> --version``` will usually tell you what version of the command/service is installed

## Activating/Enabling/Disabling services (packages)
- This will be covered in Day 2 - Processes and Run Levels
- Generally handled by a few commands and files:
    - ```service <service_name> start|stop|status```
    - ```/etc/init.d``` is the folder where the start/stop script for the services will live
    - ```/etc/rcX.d``` is the folder that will contain the init (start/stop) service run levels


## Exercise
1. Update package repositories
2. Find the package for Samba (SMB) file share utilities package
3. Install Samba file share utilities
4. Find the package for Apache Webserver (apache2) package
5. Install Apache webserver
6. Find the MySQL package
7. Install MySQL package
8. Uninstall MySQL package


## Solutions
```bash
#1
sudo apt update

#2
apt search Samba

#3
sudo apt install cifs-utils

#4
apt search Apache

#5
sudo apt install apache2

#6
apt search MySQL

#7
sudo apt install mysql-server

#8
sudo apt remove mysql-server-5.6
```