# RAID

## Steps in creating a RAID
Ensure:
- Attached storage devices (attached disks in azure)
- Created primary partitions with fdisk on each attached disk (assume /sdc and sdd for this tutorial...yours may vary)


1. Create RAID array called md0 (this is arbitrary...md is best practice to refer to raid *"multiple disk"*)
2. Check RAID build status
3. Format RAID Partition
4. Create a mount point (new directory in the root fs to mount the RAID to)
5. Mount the RAID drive to mount point
6. Find RAID UUID value
7. backup fstab file
8. Create persistence mounting with fstab

Bonus Questions:
- How do you get the long UUID into the fstab file without using your mouse or ctrl+c / ctrl+p?
- How can you get it in the right format for fstab? i.e. without "quotes" around the UUID value?
- Why are we using UUIDs?


```bash
#1 
sudo mdadm --create /dev/md0 -l 0 -n 2 /dev/sdc1 /dev/sdd1

#2
cat /proc/mdstat

#3
sudo mkfs.ext4 /dev/md0

#4
sudo mkdir /raid

#5
sudo mount /dev/md0 /raid

#6
sudo blkid | grep md0

#7
sudo cp /etc/fstab /etc/fstab.bak

#8
# now edit /etc/fstab
sudo nano /etc/fstab

# new line should look like:
UUID=aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee  /data  ext4  defaults  0  2

#### Bonus Answers ####

### #1 ###
# you'll need append the UUID of the raid device to the /etc/fstab file and edit to the correct fstab syntax
sudo blkid | grep md0 | awk '{ print $2 }' | sudo tee /etc/fstab

### #2 ###
sudo blkid | grep md0 | awk '{ print $2 }' | sed 's/\"//g' | sudo tee /etc/fstab

### #3 ###
UUIDs are universal/consisent, drive/device letters e.g. ```/dev/sdc1``` are not.
```