### Octal permissions
0   000   none
1   001   execute only
2   010   write only
3   011   write and execute
4   100   read only
5   101   read and execute
6   110   read and write
7   111   read, write, and execute (full permissions)

### SSH perms

.ssh  700
.pub  644
.priv 600

### Listing the LVM physical volumes.
`$ sudo pvdisplay`

### Listing the LVM volume groups.
`$ sudo vgdisplay`

### Listing the LVM logical volumes.
`$ sudo lvdisplay`

### Create a new logical volume.
`$ lvcreate -L [SIZE] -n [NAME] [GROUP]`
ex:
`$ sudo lvcreate -L 100G -n lovelace_data_lv1 lovelace_data`

### Create a logical volume with the rest of the free space.
`$ sudo lvcreate -l 100%FREE -n lovelace_data_lv2 lovelace_data`

### Remove a logical volume.
`$ sudo lvremove /dev/lovelace_data/lovelace_data_lv1`

### Create a new filesystem on the logical volume.
`$ sudo mkfs -t ext4 /dev/lovelace_data/lovelace_data_lv1`

### Manage the encrypted disk/partition

You can check the new device mapping with these commands:
```
$ ls -l /dev/mapper/
$ sudo cryptsetup -v status nvme0n1p4_crypt;
$ sudo cryptsetup luksDump /dev/nvme0n1p4;
```

Closing the encrypted filesystem.
```
$ sudo umount /magma-db;
$ sudo cryptsetup luksClose nvme0n1p4_crypt;
```

Remounting the encrypted filesystem.
```
$ sudo cryptsetup luksOpen /dev/nvme0n1p4 nvme0n1p4_crypt
$ sudo mount /dev/mapper/nvme0n1p4_crypt /data;
$ df -H;
```

Changing the password on the encrypted disk.
```
$ sudo cryptsetup luksDump /dev/sdb
$ sudo cryptsetup luksAddKey /dev/sdb
$ sudo cryptsetup luksRemoveKey /dev/sdb 
```
Check the disk usage of a directory.
`$ sudo du -h --max-depth=1 [DIRECTORY] | sort -hk 1,1;`

Get the line number of a grep match from a file.
`$ grep -nr [PATTERN] [FILE NAME];`

Delete the contents of a file from line N to line M.
`$ sed -i.bak -e '[N],[M] d' [FILE NAME];`

Extract the contents of a file from line N to line M.
`$ sed -n [N],[M]p [FILE NAME] > [NEW FILE NAME]`

Check the info for a git remote.
`$ git remote show [REMOTE NAME];`

Add new remote to a git repo.
`$ git remote add [REMOTE NAME] [ADDER/LOCATION]`

.ssh dir perms
`$ chmod 700 ~/.ssh;`
`$ chmod 640 ~/.ssh/authorized_keys;`
`$ chmod 640 ~/.ssh/*.pub;`

/etc/ssl dir perms
`$ sudo chown -r root:ssl-cert /etc/ssl/[hostname]`
`$ sudo chmod 640 /etc/ssl/[hostname]/[hostname].key`

Set an alarm (OSX).
`sleep [SECONDS] && afplay [AUDIO FILE] &`

## Setting up a VirtualBox shared folder to automount on startup.

Check that you have the matching kernal headers! This is probably the most important step. You should see matching items from these two steps.

`$ uname -r;`
`$ ls -al /usr/src/kernels/;`

Make sure you have the virtual box guest additions mounted to install.

`$ sudo mkdir /media/cdrom;`
`$ sudo mount -r /dev/cdrom /media/cdrom;`

Install the guest addtions.
`$ sudo KERN_DIR=/usr/src/kernels/[KERNAL FOLDER] /media/cdrom/VBoxLinuxAdditions.run`

Find the uid and gid of the folder you want to mount to.
`$ ls -al [MOUNT POINT];`
`$ id -g [USER];`
`$ id -u [USER];`

Add an entry into the `/etc/fstabs` file.
[SHARED FOLDER NAME] [MOUNT POINT] [FILE SYSTEM TYPE] [OPTIONS] [DUMP FLAG] [MOUNT PRIORITY]
ex:
```
magma /var/www/magma vboxsf rw,uid=1000,gid=1000,comment=systemd.automount 0 0
```

The share folder name is set in your VirtualBox host. The mount point is created in the guest. You will need to know the owner id and group id of that folder. The file system type will be 'vboxsf' and is added to the guest system from the guest addition install step. In the options we specify that the mounted filesystm be read/write (rw). We set the owner and group id's, you've obtained earlier, here as well. The 'comment' is essential as it tells fstab to let systemd handle the mounting (we are using centos here).

