# Persistent/Auto Mounting File System Devices with ```/etc/fstab```

## fstab syntax
```
# <device>                                    <mountpoint>    <filesystemtype>    <options>   <dump>  <fsckorder>
UUID=aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee     /data           ext4                defaults    0       2
//10.0.1.1/file-share-name                    /media/samba    cifs                credentials=/path/to/.credentialsfile,defaults    0       0
192.168.0.10:/NFS-SHARE                       /media/nfs      nfs                 defaults    0       0
```

## Options
- ```defaults```
    - Default settings: Equivalent to rw,suid,dev,exec,auto,nouser,async.
- ```sync / async```
    - All I/O to the file system should be done (a)synchronously.
- ```auto```
    - The filesystem can be mounted automatically (at bootup, or when mount is passed the -a option)
    - This is really unnecessary as this is the default action of mount -a anyway
- ```noauto```
    - The filesystem will NOT be automatically mounted at startup, or when mount passed -a
    - You must explicitly mount the filesystem
- ```dev / nodev```
    - Permit any user to mount the filesyste
    - This automatically implies noexec
- ```exec / noexec```
    - Permit/Prevent the execution of binaries from the filesystem
- ```suid / nosuid```
    - Permit/Block the operation of suid, and sgid bits
- ```ro```
    - Mount as read-only
- ```rw```
    - Mount with read-write
- ```user```
    - Permit any user to mount the filesystem
    - This automatically implies noexec, nosuid,nodev unless overridden
- ```nouser```
    - Only permit root to mount the filesystem. This is also a default setting

## ```dump``` and ```fsckorder```
- ```dump```
    - used by "dump" to decide to if a file system should be backed up
    - if "0" value it will not backup file system
- ```fsckorder```
    - determines whether to check the filesystem
    - if "0" ```fsck``` will not check filesystem of disk

```bash
sudo cp /etc/fstab /etc/fstab.bak

# now edit /etc/fstab
sudo nano /etc/fstab

# new line should look like:
UUID=aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee  /raid  ext4  defaults  0  2

#### Bonus Answers ####

### #1 ###
# you'll need append the UUID of the raid device to the /etc/fstab file and edit to the correct fstab syntax
sudo blkid | grep sdc | awk '{ print $2 }' | sudo tee /etc/fstab

### #2 ###
sudo blkid | grep sdc | awk '{ print $2 }' | sed 's/\"//g' | sudo tee /etc/fstab

### #3 ###
UUIDs are universal/consisent, drive/device letters e.g. ```/dev/sdc1``` are not.
```