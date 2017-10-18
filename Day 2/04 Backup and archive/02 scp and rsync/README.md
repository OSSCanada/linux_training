# SCP and RSYNC

## SCP

Format:
```bash
# from a remote sever
scp username@remoteserver.domain.com:"/path/to/remote/directory/file.txt" /path/to/local/directory

# to a remote server
scp /path/to/local/directory/file.txt username@remoteserver.domain.com:"/path/to/directory/directory" 
```

### Exercises
1. copy the file ```archive.tar.bz2``` from the previous ```tar and compression``` exercises, to a remote server
    - should be able to use a classmate's server
        - Reuse user account created from previous exercises (martok/klingon) 
        - e.g martok@"useralias"linuxtraining.canadacentral.cloudapp.azure.com

2. Do the reverse, download the file ```hello.txt``` back from the remote server to your ```backups``` folder

### Solutions
```bash
#1 
scp archive.tar.bz martok@"useralias"linuxtraining.canadacentral.cloudapp.azure.com:~/backup

#2
scp martok@"useralias"linuxtraining.canadacentral.cloudapp.azure.com:~/backup/hello.txt ~/backups
```

## RSYNC

Format:
```bash
# on local system - copy contents of directory_1/ to directory_2. ##NOTE## the trailing slash "/" for directory_1/
rsync -a /path/to/local/directory_1/ /path/to/local/directory_2

# push to remote system
rsync -a ~/directory_1/ username@remoteserver.domain.com:"/path/to/remote/directory_2"

# pull from remote system
rsync -a username@remoteserver.domain.com:"/path/to/remote/directory_2/" /path/to/local/directory_1
```