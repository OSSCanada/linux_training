1. sudo apt install cryptsetup
2. cryptsetup -y luksFormat /dev/sde1
3. cryptsetup luksOpen /dev/sde1 encrypted_drive
4. mkfs.ext4 /dev/mapper/encrypted_drive
5. mkdir /mnt/encrpyt
6. mount /dev/mapper/encrypted_drive /mnt/encrpyt