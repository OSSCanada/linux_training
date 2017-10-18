# File System ACLs

ACLs are very similar to POSIX permissions (chmod based commands).  Some ACL properties leverage POSIX permissions to operate.  You can view ACLs as an additional supplemental set of permission controls on top of POSIX.

## Commands
- ```getfacls```
    - gets the FS acls for a file/directory
- ```setfacls```
    - sets the FS acls for a file/directory


## Setting ACLs
```
setfacl -m u::rw -m g::rx -m o::r /mnt/files/some.file.txt
```
- ```-m``` modify
- ```u::rwx``` user.  you can also specify a specific user ```u:username:rwx```
- ```g::rwx``` group. you can also specify a specific group ```g:group:rwx```
- ```o::rwx``` other
- ```-d``` sets the defaults for a directory
- ```setfacls -d -m o:r``` gives other users the default permission of read on a directory and children
 
## Exercises
1. Set default permissions on your ```backups``` folder to user: write, group: write
 
## Solutions
```bash
#1
setfacl -d -m u::w -m g::w backups
 ```