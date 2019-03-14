https://www.tldp.org/HOWTO/SMB-HOWTO-8.html
smb://fonglabsrv1.ucsf.edu/CIL

## Accessing an SMB Share With Linux Machines

Linux (UNIX) machines can also browse and mount SMB shares. Note that this can be done whether the server is a Windows machine or a Samba server!

An SMB client program for UNIX machines is included with the Samba distribution. It provides an ftp-like interface on the command line. You can use this utility to transfer files between a Windows 'server' and a Linux client.

Most Linux distributions also now include the useful smbfs package, which allows one to mount and umount SMB shares. More on smbfs below.

To see which shares are available on a given host, run: 

`$ /usr/bin/smbclient -L host`

where 'host' is the name of the machine that you wish to view. this will return a list of 'service' names - that is, names of drives or printers that it can share with you. Unless the SMB server has no security configured, it will ask you for a password. Get it the password for the 'guest' account or for your personal account on that machine.

For example: 

`$ smbclient -L zimmerman`

The output of this command should look something like this: 

```
Server time is Sat Aug 10 15:58:27 1996
Timezone is UTC+10.0
Password: 
Domain=[WORKGROUP] OS=[Windows NT 3.51] Server=[NT LAN Manager 3.51]

Server=[ZIMMERMAN] User=[] Workgroup=[WORKGROUP] Domain=[]

        Sharename      Type      Comment
        ---------      ----      -------
        ADMIN$         Disk      Remote Admin
        public         Disk      Public 
        C$             Disk      Default share
        IPC$           IPC       Remote IPC
        OReilly        Printer   OReilly
        print$         Disk      Printer Drivers


This machine has a browse list:

        Server               Comment
        ---------            -------
        HOPPER               Samba 1.9.15p8
        KERNIGAN             Samba 1.9.15p8
        LOVELACE             Samba 1.9.15p8
        RITCHIE              Samba 1.9.15p8
        ZIMMERMAN            
```

The browse list shows other SMB servers with resources to share on the network.

To use the client, run: 

`$ /usr/bin/smbclient service <password>`

where 'service' is a machine and share name. For example, if you are trying to reach a directory that has been shared as 'public' on a machine called zimmerman, the service would be called \\zimmerman\public. However, due to shell restrictions, you will need to escape the backslashes, so you end up with something like this: 

`$ /usr/bin/smbclient \\\\zimmerman\\public mypasswd`

where 'mypasswd' is the literal string of your password.

You will get the smbclient prompt: 

```
Server time is Sat Aug 10 15:58:44 1996
Timezone is UTC+10.0
Domain=[WORKGROUP] OS=[Windows NT 3.51] Server=[NT LAN Manager 3.51]
smb: \> 
```

Type 'h' to get help using smbclient: 

```
smb: \> h
ls             dir            lcd            cd             pwd            
get            mget           put            mput           rename         
more           mask           del            rm             mkdir          
md             rmdir          rd             prompt         recurse        
translate      lowercase      print          printmode      queue          
cancel         stat           quit           q              exit           
newer          archive        tar            blocksize      tarmode        
setmode        help           ?              !              
smb: \> 
```

If you can use ftp, you shouldn't need the man pages for smbclient.

Although you can use smbclient for testing, you will soon tire of it for real work. For that you will probably want to use the smbfs package. Smbfs comes with two simple utilties, smbmount and smbumount. They work just like mount and umount for SMB shares.

One important thing to note: You must have smbfs support compiled into your kernel to use these utilities!

The following shows a typical use of smbmount to mount an SMB share called "customers" from a machine called "samba1": 

```
[root@postel]# smbmount "\\\\samba1\\customers" -U rtg2t -c 'mount /customers -u 500 -g 100'
Added interface ip=192.168.35.84 bcast=192.168.255.255 nmask=255.255.0.0
Got a positive name query response from 192.168.168.158 ( 192.168.168.158 )
Server time is Tue Oct  5 10:27:36 1999
Timezone is UTC-4.0
Password:
Domain=[IPM] OS=[Unix] Server=[Samba 2.0.3]
security=user
```

Issuing a mount command will now show the share mounted, just as if it were an NFS export: 

```
[root@postel]# mount                                                                                                    
/dev/hda2 on / type ext2 (rw)
none on /proc type proc (rw)
none on /dev/pts type devpts (rw,mode=622)
//SAMBA1/CUSTOMERS on /customers type smbfs (0)
```
