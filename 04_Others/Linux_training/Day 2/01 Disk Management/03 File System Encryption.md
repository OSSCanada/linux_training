1. sudo apt install cryptsetup
2. sudo cryptsetup -y luksFormat /dev/sde1
3. sudo cryptsetup luksOpen /dev/sde1 encrypted_drive
4. sudo mkfs.ext4 /dev/mapper/encrypted_drive
5. sudo mkdir /encrpyt
6. sudo mount /dev/mapper/encrypted_drive /encrpyt