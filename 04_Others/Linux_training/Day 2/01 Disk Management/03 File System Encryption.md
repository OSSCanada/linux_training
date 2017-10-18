# File system encryption

```
# 1 install encryption service
sudo apt install cryptsetup

# 2 Setup encrpytion on drive (you will be asked to enter encryption key/passphrase)
sudo cryptsetup -y luksFormat /dev/sde1

#3 Make the encrypted drive accessible (will be prompted for decryption key)
sudo cryptsetup luksOpen /dev/sde1 encrypted_drive

#4 format the drive
sudo mkfs.ext4 /dev/mapper/encrypted_drive

#5 create a folder in your local file system, used for mounting/accessing the encrypted drive
sudo mkdir /encrpyt

#6 mount the encrypted drive to a folder as usual
sudo mount /dev/mapper/encrypted_drive /encrpyt
```