# Network File Storage

## etc/fstab examples
```
//10.0.1.1/file-share-name                    /media/samba    cifs                credentials=/path/to/.credentialsfile,defaults    0       0
192.168.0.10:/NFS-SHARE                       /media/nfs      nfs                 defaults    0       0
```