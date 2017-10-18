# Network File Storage

We will be using [Azure File Storage] (https://docs.microsoft.com/en-us/azure/storage/storage-how-to-use-files-linux) for this example.

## Links
- [Create file share through Command Line Interface (CLI)](https://docs.microsoft.com/en-us/azure/storage/storage-file-how-to-create-file-share#create-file-share-through-command-line-interface-cli)
- [How to use Azure File Share with Linux](https://docs.microsoft.com/en-us/azure/storage/storage-how-to-use-files-linux)

## Requisites
- An Azure File Storage account created and accessible with a username (storage account name)/password (storage key) pair (see scripts folder for bash commands to create file share)
- install ```cifs-utils``` on your Linux OS

## Mounting network file storage

### Example 1: On demand (non-persistent/temporary)

This method mounts a network file storage device on demand and temporarily.  This means that the network file storage will not be automatically mounted upon system reboot.

### Example 2: Persistent network file storage

This method mounts a network file storage device persistently.  It leverages the ```/etc/fstab``` file, which the Linux OS uses to mount both local and network drives.

## etc/fstab examples

```
//10.0.1.1/file-share-name                    /media/samba    cifs                credentials=/path/to/.credentialsfile,defaults    0       0
192.168.0.10:/NFS-SHARE                       /media/nfs      nfs                 defaults    0       0
```