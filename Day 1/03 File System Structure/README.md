# File System Structure


## Most important files and folders

- ```/``` is the root file system.  Think of it as the trunk/highest level of your file system hierarchy
- ```~``` aka "tilde" represents the current users' home directory.  It can be used as a short cut to change directory (```cd```) to the users' home directory (```cd ~```)
- ```/home``` represents the typical partent directory for all user home directories
- ```/etc``` is where most of the important config files are found
    - ```/etc/init.d``` where all the start/stop/status scripts for services and processes are generally found
    - ```/etc/rcX.d``` where all the init/run level number where (```X``` = [0-6]) scripts are found
        - they are symlinks to the equivalent service's file found in ```/etc/init.d```
        - filenames that start with either ```S00ServiceName``` or ```K00ServiceName``` 
            - where ```S``` is to start a process at ```rcX.d``` run level
                - followed by a priority number ```00``` smaller is higher priority
            - where ```K``` is to stop (or kill) a process at ```rcX.d``` run level
                - followed by a priority number ```00``` larger is higher priority
            - where ```ServiceName``` corresponds to the ```/etc/init.d/``` filename for the service
    - ```/etc/skel``` is where the default template for files/folders for new user home directories are stored
        - adding files and folders here will make copies of the files/folders to newly added user directories
    - ```/etc/environment``` is where global Environment variables are stored
        - Global ```$PATH``` variable is found here
    - ```/etc/security```
        - additional files
    - ```/etc/passwd``` is the file that lists most user info (login shell, home directory etc)
    - ```/etc/sudoers``` is the file which stores the info on who has elevated user privileges (sudo)
    - ```/etc/fstab``` is where information on mounted drives (local and network) are stored for persistent/auto mounting
    - ```/etc/crypttab``` is where encryption information about drives is kept
    - ```/etc/apache2``` is where your apache2 web server config files are stored
- ```/usr/bin``` is generally where most commands are either saved or symlinked to/from
- ```/var/log``` is where most log files are saved to, usually under the service/process's own sub folder e.g. ```/var/log/apache2/``` is where you'll find the Ubuntu log files for Apache2 web server (access, error others)
- ```/dev``` is the folder where devices (hard drives, USB, printers etc) are initially found in
    - you do not typically acccess these devices directly from here, especially storage
    - storage devices need to be mounted somewhere under the root "```/```" file system or subdirectories


## Commands

- ```ls``` lists current directory's file and folder contents
- ```cd``` stands for "change directory" - allows you to navigate the file system
- ```mkdir <directory_name>``` creates a directory ```<directory_name>```
    - make sure to use the ```-p``` flag if you're creating a nested directory which may not have all it's parent directories created 
    - e.g. ```mkdir -p path/to/directory``` will create all 3 directories if they do not exist: ```path```, ```to``` and ```directory```
- ```touch <filename.extention>``` will create an empty file ```<filename.extention>```
- ```rm <filename or directory_name>``` removes a file or directory
    - use ```rm -r <directory_name>``` to recursively all files and folders from a non-empty directory
    - **DO NOT USE** ```sudo``` before this unless you know what you are doing!!! **very dangerous**
- ```chmod``` change mod - allows you to modify file/folder permissions
- ```chown user:group <file/folder name>``` change ownership - allows you to modify the owner (user:group) of a file/folder
- ```which <command>``` will find where the command is if it is installed and in the ```$PATH```
- ```<command> --version``` will usually tell you what version of the command/service is installed

## File and Folder Ownership

Files and folders have a User and Group that owns it.  You can see this as part of the out put of ```ls -l``` command in the ```3rd``` and ```4th``` columns.  Below the user and group for the following 2 files are ```raykao``` and ```staff``` respectively.

```bash
-rw-r--r--   1 raykao  staff   41314 13 Aug 19:23 long_text_file.txt
-rw-r--r--   1 raykao  staff      64 13 Aug 21:00 results.txt
```

### Changing ownerhship

```bash
chown -R username:groupname <file or folder name>
```

- ```chown``` is the command to use
- ```-R``` runs the command recurssively, used for folders/directories so that all children files/sub folders also have file ownership changed
- ```username:groupname``` explicitly states who the new user and group owner are
    - if you omit ```:groupname``` it will not change the original user owner
    - if you omit ```username``` but keep both the ```:``` and ```groupname``` it will only change the group


## File and Folder Permissions

### Symbolic notation
- r = read
- w = write
- x = execute
- s = sticky bit and shows up at the execute bit position when enabled
    - the sticky bit protects a folder and children files/folder from being renamed or deleted only by owner of the folder/files or root user
    - the sticky bit on a file is ignored in Linux

#### adding/removing permissions symbolically
```bash
# add read to user
# add read and write to group
# remove write and execute to others
chmod u+r g+rw o-wx filename.txt

# sticky bit

chmod +s
chmod -s
```

(u)ser    / (g)roup     / (o)thers
rwx       rwx         rwx

#### Example ouput
```bash
rwxr-xr-x   7 raykao  staff     238 13 Aug 21:52 .
drwxr-xr-x  11 raykao  staff     374 13 Aug 17:43 ..
-rw-r--r--   1 raykao  staff      72 13 Aug 21:53 file.tsv
-rw-r--r--   1 raykao  staff   41314 13 Aug 19:23 long_text_file.txt
-rw-r--r--   1 raykao  staff      64 13 Aug 21:00 results.txt
-rw-r--r--   1 raykao  staff      64 13 Aug 20:23 sort_uniq.txt
-rw-r--r--   1 raykao  staff  799329 13 Aug 17:44 split.txt
drwsrwsr-t   2 raykao  staff  4096   14 Aug 02:46 sticky
```

### Numeric notation
Can be a quicker way to add/remove permissions if you can do the math...

- The read bit adds 4 to its total
- The write bit adds 2 to its total
- The execute bit adds 1 to its total

Example: ```User ->    Read (4) + Write (2) + Execute (1) = 7```

Example: ```Group ->   Read (4) + No Write (0) + Execute (1) = 5```

Example: ```Others ->  Read (0) + No Write (0) + Execute (0) = 0```

permission will be:
```
ugo = 750
```

equivalent of ```750``` in symbolic notation is ```rwx r-x ---```

#### adding/removing permissions symbolically
```bash
chmod 750 filename.txt
```

## Exercises
1. create a file named "script.sh"
2. add the following lines and save the file:
```
#! /bin/bash

echo "hello world!"
```

3. do an ```ls -la script.sh``` to see the details about the file.  The output should looklike:
```bash
-rw-rw-r-- 1 linuxadmin linuxadmin 0 Aug 14 17:27 script.sh
```

4. Based on the output can you tell if the file executable? By who?

5. Try to run/execute the file ```./script.sh```

6. Make the file executable by your user account

7. run the script now ```./script.sh```

8. run ```ls -la script.sh``` to see your file permissions

9. remove the execute bit

10. What is the numeric notation for User:read+write, Group:read, Other: execute

11. User:read, Group:write, Other:no permissions

12. All rights to everyone (DANGEROUS!!!)

```bash
#1
touch script.sh

#2 Your script file should look like:
#! /bin/bash

echo "hello world!"

#3 
ls -la script.sh
#output:
-rw-rw-r-- 1 linuxadmin linuxadmin 0 Aug 14 17:27 script.sh

#4
Yes you can tell.
No one can execute (the x bit is not visible in any of User/Group/Other in the file permissions)
-rw-rw-r-- (No x anywhere)

#5
You will get an error...so no, not executable

#6 Method 1 - symbolic notation
chmod u+x script.sh

#6 Method 2 - numeric notation
chmod 744 script.sh

#7 output:
hello world!

#8 execute bit is now added
-rwxrw-r-- 1 linuxadmin linuxadmin 0 Aug 14 17:27 script.sh

#9 Method 1 - symbolic notation
chmod u-x script.sh

#9 Method 2 - numeric notation
chmod 644 script.sh

#10
641

#11 
420

#12
777

```