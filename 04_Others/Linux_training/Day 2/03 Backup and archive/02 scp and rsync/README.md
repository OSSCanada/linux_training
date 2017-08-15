# SCP and RSYNC

## SCP

Format:
```bash
# from a remote sever
scp username@remoteserver.domain.com:"/path/to/remote/directory/file.txt" /path/to/local/directory

# to a remote server
scp /path/to/local/directory/file.txt username@remoteserver.domain.com:"/path/to/directory/directory" 
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