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

