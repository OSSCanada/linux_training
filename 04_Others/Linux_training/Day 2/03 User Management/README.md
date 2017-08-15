# Important things to remember

## Important Files/Folders
- ```$PATH``` variable defines where the default path(s) to lookup commands that a user can call are found.
- ```~/.bashrc```, ```~/.bash_profile```, ```~/.profile```
    - User specific environment files.  Defines a specific user's Environment variables such as ```$PATH``` variable
- ```/etc/passwd``` is where the important info about a user is stored!!!
    - modify this file to change:
        - the user's home directory
        - default shell (```/bin/bash```, ```bin/zsh```, ```/usr/sbin/nologin``` etc) 
        - disable terminal login for user (```/usr/sbin/nologin```)
- ```/etc/skel``` is where the default file and folder settings for a user's home directory are.  Add to this folder to modify what gets added to a new user's home directory (use ```sudo``` to create folders/files)
    - example:
        - modify/add the ```.bashr```, ```.bash_profile```, ```.profile``` etc to include default commands or environment variables to all new users
- ```/etc/environment``` is where the default environment variables for all users is located.
    - modify this to add to the the ```$PATH``` variable globally
- ```/etc/sudoers``` this file outlines which users and groups have super user (sudo/root) powers
    - users are idenfitied with their ```username``` as the first item on each line
    - groups are idenfiied with a ```%group_name``` as the first item on each line
    - privilege can be for
        - all commands ```someuser ALL=(ALL): ALL```
        - specific commands ```someuser ALL=(ALL): /bin/ls```
        - allow password-less running of command (user does not need to enter password to run as ```sudo```) ```someuser ALL=(ALL:ALL) NOPASSWD: ALL```



## Important Commands
These commands should be run with elevated privilege (```sudo```).

- ```adduser```
- ```deluser```
- ```passwd <username>``` change a user's password.
- ```usermod``` modify user details
    - Add a supplemental group to a user account ```usermod -a -G <group_name> <user_name>```
        - useful for adding a user to ```sudo``` group
    - Lock a user account ```-L``` or ```--lock```
    - Unlock a user account ```-U``` or ```--unlock```
    - Expiry Date ```-e``` or ```-expiredate``` sets the date when a user account expires in ```YYYY-MM-DD``` format
    - Grace period after password expiration ```-f``` or ```--inactive```
- ```sudo -i``` switch to root user interactive shell
- ```su <username>``` will allow you to switch to another user (prompt for password if you are not root user)


## Limit user resources
- ```/etc/security/limits.conf```

## ACLs
- ```getfacl```
    - command that lists the acl permissions on a file/folder
- ```setfacl```
    - command that sets the acl permissions on a file/folder

## Exercises
1. Add a new user "captain" with password "picard"
2. Add user to ```sudo``` admin group
3. Change user's default shell to ```zsh```
4. Change user's home directory to ```/home/enterprise/```
5. Allow user to not require a password to run ```sudo``` commands
6. Add a new user "martok" with password "klingon" (we will use this user for backup exercise)
7. Create a folder ```backup``` in user ```martok``` home directory
8. Create a file ```hello.txt``` user ```martok``` the newly created backup directory
9. Create a folder ```special_commands``` in user ```martok```'s home directory
10. Add the folder ```special_commands``` to ```martok```'s ```$PATH``` variable
11. Create a new folder ```Documents``` that will be copied to all new user's home directories

## Solution
```bash
#1 
sudo adduser captain

#2
sudo usermod -a -G sudo captain

#3
sudo nano /etc/passwd
# change the /bin/bash to /bin/zsh
#
# captain:x:1001:1001:,,,:/home/captain:/bin/bash
# to
# captain:x:1001:1001:,,,:/home/captain:/bin/zsh

#4
# change the home directory /home/captain to /home/enterprise
#
# captain:x:1001:1001:,,,:/home/captain:/bin/zsh
#to
# captain:x:1001:1001:,,,:/home/enterprise:/bin/bash

#5
sudo visudo
# Add to the end of the file:
captain ALL=(ALL:ALL) NOPASSWD: ALL

#6
sudo adduser martok

#7
sudo -i
su marktok
cd ~/
mkdir backup

#8
touch ~/backup/hello.txt

#9
mkdir ~/special_commands

#10
echo '$PATH="/home/martok/special_commands/:$PATH"' >> .bash_profile

#11
sudo mkdir /etc/skel/Documents
```