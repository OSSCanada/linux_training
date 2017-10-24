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

There are 3 main concepts to LVM
- Physical disks are your phyiscal storage devices, these are added to a (Logical) Volume Group
- A (Logical) Volume Group is a pool of storage, which Logical Volumes are created from
- Logical Volumes are essentially the usable partitions from which you access/write data to (format and mount this logical device to your File System)

Once you've created a logical volume, can format and mount it from ```/dev/LVMVolumeGroupName/logicalVolumeName``` NOT from the physical storage device/partition format from GDISK/FDISK methods e.g. ```/dev/sdc1```.  The physical drives have been added to a software handled volume and accessing them has been abstracted away at a higher level via LVM.

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

# for "raw" disks with no MBR/GPT partition written
sudo vgcreate LVMVolumeGroup /dev/sde /dev/sdf

# for disks with a partion already written you'll need to reference the partition
sudo vgcreate LVMVolumeGroup /dev/sde1 /dev/sdf1

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

You can only format Logical Volumes or Partitions on a storage device.  As such you will need to create a logical volume or a partition first before using ```mkfs```.  A partition will show up as a numbered device.  For example - assume we use physical storage device ```sdc```, the partition will be labeled/accessible for formating as: ```/dev/sdc1``` presuming we wish to use the first partition on that device.

To see all the devices and their partitions you can use the following commands:
```
sudo fdisk -l [optional device name: e.g. /dev/sdx]
sudo sfdisk # displays info in MB

sudo parted -l

df -h # only displays information about mounted drives, and -h is human readable, i.e. displays in Gigs, Megs etc
```

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

# Getting a drive's UUID

You can only get the UUID for a formated device/partition.  You can use the following command to list all known devices/partitons with UUIDs assigned:

```bash
sudo blkid

# Example output
/dev/sda1: LABEL="cloudimg-rootfs" UUID="588c5fce-9524-4c1d-8261-7204d9d45110" TYPE="ext4"
/dev/sdb1: UUID="d655b0a0-7fdb-4a30-b60d-c69fd7ad639f" TYPE="ext4"
/dev/sdc1: UUID="b95918ef-63e4-4614-aa06-6f5cc1fb285c" TYPE="ext4"
```

# Mounting a drive (non-peristent/on-demand mounting)

```bash
sudo mkdir /mounted

# Generic mount - however bad practice for persistent mounting as Device name (/dev/sdc) is not guarnteed on reboot
# Drive mounting order is not guaranteed
sudo mount /dev/sdc1 /mounted


# Best practice way - use UUID
# UUIDs are unique and consistent across reboots and attaching to another VM
sudo mount UUIID=b95918ef-63e4-4614-aa06-6f5cc1fb285c /mounted

# Logical Volumes with LVM
# It is safe to reference LVM Logical volumes by name as LVM handles the association for you
# However it is still best practices to use the UUID for consistency
sudo mount /dev/LVMVolumeGroup/lvm1 /mounted
```