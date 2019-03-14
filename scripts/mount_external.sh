# https://www.cyberciti.biz/hardware/howto-linux-hard-disk-encryption-with-luks-cryptsetup-command/

# Encrypt a disk.
# cryptsetup -y -v luksFormat /dev/xvdc

# Open this disk for mounting.
# cryptsetup luksOpen /dev/xvdc backup2
# cryptsetup luksClose blah

# You can see a mapping name /dev/mapper/backup2 after successful verification
# of the supplied key material which was created with luksFormat command
# extension:
# ls -l /dev/mapper/backup2 

# You can use the following command to see the status for the mapping:
# cryptsetup -v status backup2

# You can dump LUKS headers using the following command:
# cryptsetup luksDump /dev/xvdc

# Next, create a filesystem i.e. format filesystem, enter:
# mkfs.ext4 /dev/mapper/backup2

# First, you need to write zeros to /dev/mapper/backup2 encrypted device. This will allocate block data with zeros. This ensures that outside world will see this as random data i.e. it protect against disclosure of usage patterns:
# dd if=/dev/zero of=/dev/mapper/backup2

# sudo cryptsetup luksOpen /dev/sda external_disk_crypt
# sudo mount /dev/mapper/external_disk_crypt /mnt/external
# sudo umount /mnt/external 
# sudo cryptsetup luksClose /dev/mapper/external_disk_crypt
