# Drive Partitions 

## Gdisk

Creates GPT type partitions table and MBR for backwards compatibility (older systems won't try to format drive).

### Steps
1. run ```gdisk``` command
2. choose a partition number
3. choose first sector
4. choose last sector (use size is easiest...we'll use the entire drive for most examples)
5. choose file system type (you can look through a list or use default linux filesystem 9/10)
6. write partition
7. Partition/Drive ready for File System formatting

## LVM

Uses GPT type partion and can support virtually unlimited disk sizes/partitions.  LVM is the future.

### Install
```bash
sudo apt search "logical volume manager"

sudo apt install lvm2
```

### Steps
1. scan for available disks
2. create physical volumes
3. create volume groups (pool physical volumes together)
4. create logical volumes
5. format logical volumes as normal using ```mkfs```


```bash
#1
sudo lvmdiskscan

#output
  /dev/sda1  [      30.00 GiB]
  /dev/sdb1  [     100.00 GiB]
  /dev/sde   [      20.00 GiB] LVM physical volume
  /dev/sdf   [      20.00 GiB] LVM physical volume
##

#2
sudo pvcreate /dev/sde /dev/sdf

#output
  Physical volume "/dev/sde" successfully created
  Physical volume "/dev/sdf" successfully created
##

## verify (optional)
sudo pvs

#ouput
  PV         VG   Fmt  Attr PSize  PFree
  /dev/sde        lvm2 a--  20.00g 20.00g
  /dev/sdf        lvm2 a--  20.00g 20.00g
## 
```

```bash

# 3
sudo vgcreate LVMVolumeGroup /dev/sde /dev/sdf

#output
  Volume group "LVMVolumeGroup" successfully created
##

## Verify (optional)
sudo pvs

#output
  PV         VG             Fmt  Attr PSize  PFree
  /dev/sde   LVMVolumeGroup lvm2 a--  20.00g 20.00g
  /dev/sdf   LVMVolumeGroup lvm2 a--  20.00g 20.00g
## 

## Verify (optional)
sudo vgs

#output
  VG             #PV #LV #SN Attr   VSize  VFree
  LVMVolumeGroup   2   0   0 wz--n- 39.99g 39.99g
##
```

```bash
# 4
sudo lvcreate -L 10G -n logVol1 LVMVolumeGroup
sudo lvcreate -L 20G -n logVol2 LVMVolumeGroup
sudo lvcreate -L 5G -n logVol3 LVMVolumeGroup
sudo lvcreate -l 100%FREE -n logVol4 LVMVolumeGroup

## Verify (optional)
sudo vgs -o +lv_name,lv_size

#output
  VG             #PV #LV #SN Attr   VSize  VFree LV      LSize
  LVMVolumeGroup   2   4   0 wz--n- 39.99g    0  logVol1 10.00g
  LVMVolumeGroup   2   4   0 wz--n- 39.99g    0  logVol2 20.00g
  LVMVolumeGroup   2   4   0 wz--n- 39.99g    0  logVol3  5.00g
  LVMVolumeGroup   2   4   0 wz--n- 39.99g    0  logVol4  4.99g
##
```

# Formatting Drives/Partitions

There several types of file system formats for linux:
- ```ext3```
- ```ext4```
- ```btrfs```
- ```xfs```
- ```ntfs```
- ```fat```
- many more

The command ```mkfs``` (make file system) handles this for us.  Generally you would use the ```-t``` flag and pass a FS type param in.  Thankfully ```mkfs``` comes with helper commands to simplify.  Each simplifed command comes in the format ```mkfs.<fstype>```.

To see all the differnt helper commands:
```bash
which mkfs
ls /sbin | grep mkfs

## output should be:
mkfs
mkfs.bfs
mkfs.cramfs
mkfs.ext2
mkfs.ext3
mkfs.ext4
mkfs.ext4dev
mkfs.fat
mkfs.minix
mkfs.msdos
mkfs.ntfs
mkfs.vfat
```

As an example, to create a ```ext4``` file system on device/partition ```/dev/sdc1``` you should use:

```bash
sudo mkfs.ext4 /dev/sdc1
```

If a file system does not exist here, you will likely need to install it from a package repository (apt).


# Mounting a drive (non-peristent/on-demand mounting)

```bash
sudo mkdir /mounted

sudo mount /dev/sdc1 /mounted
```