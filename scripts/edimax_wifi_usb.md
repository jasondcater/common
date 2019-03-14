At the bottom of this link, seemed to have a solution.

https://askubuntu.com/questions/509498/is-there-a-standard-wifi-driver-for-the-edimax-ew-7811un

We need to download the source code from Edimax:
https://www.edimax.com/edimax/merchandise/merchandise_detail/data/edimax/global/wireless_adapters_n150/ew-7811un

Then we need to run:

```
$ sudo make clean
$ sudo make
```

This should generate a file called 8192cu.ko
We can use modprobe to load that file.
The version of the driver I downloaded is:
`EW-7811Un_Linux_Driver_1.0.1.9`
and it looks like it was designed for linux kernal 4.0.9
`rtl8188C_8192C_usb_linux_v4.0.9_20171222`

------------------------------------------------------------
PRIVIOUS STUFF THAT DIDNT WORK.

https://github.com/pvaret/rtl8192cu-fixes

https://askubuntu.com/questions/509498/is-there-a-standard-wifi-driver-for-the-edimax-ew-7811un

https://edimax.freshdesk.com/support/solutions/articles/14000035492-how-to-resolve-ew-7811un-built-in-driver-issues-in-linux-kernel-v3-10-or-higher

https://askubuntu.com/questions/909142/unable-to-locate-package-linux-firmware-nonfree

How to resolve EW-7811Un built-in driver issues in Linux kernel v3.10 or higher

Modified on: Tue, 27 Mar, 2018 at 9:51 AM

The Official driver for EW-7811Un supports Linux kernel up to v3.9 only.  Any versions higher than that are not supported.  However, starting from kernel v3.10, there is a built-in driver for our EW-7811Un.  You don't need to install any driver, i.e. Plug-and-Play.


If you have issue(s) with the built-in driver, it may be related to this bug.  The solution is to use an open source driver from github as suggested from the bug report's comment #8.


Here's the instructions on how to install the open source driver from github on Debian-based Linux OS with kernel v3.10 or higher.  Installation is done using Command Line Interface (CLI) in a Terminal program.  Commands are in green below and you should type them in one command at a time.

    plugin the EW-7811Un to your system's USB port (2.0 preferred)
    make sure your system has temporary Internet connection
    open a Terminal program
    make sure your system is up-to-date
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
    [ Note:  You may need to restart your system if kernel update has been installed. ]
    install the necessary files to compile a device driver
    sudo apt-get install linux-headers-$(uname -r) build-essential dkms git
    restart your system
    sudo reboot
    after finished booting up, open a Terminal program again
    clone the github repository
    git clone https://github.com/pvaret/rtl8192cu-fixes.git
    [ Note:  Right after "rt", it is a letter "l" (like Larry), not a number "1" (like 1980.)  Typing it wrong will cause GitHub to ask for Username and Password.  Please note that accordingly. ]
    setup as DKMS module
    sudo dkms add ./rtl8192cu-fixes
    build and install the rtl8192cu driver
    sudo dkms install 8192cu/1.11
    refresh modules list
    sudo depmod -a
    blacklisted the native kernel
    sudo cp ./rtl8192cu-fixes/blacklist-native-rtl8192.conf /etc/modprobe.d/
    disable power management
    sudo cp ./rtl8192cu-fixes/8192cu-disable-power-management.conf /etc/modprobe.d/
    restart your system to use the new driver
    sudo reboot


That's it!


For removal, you can use the following commands.


sudo su

rm /etc/modprobe.d/blacklist-native-rtl8192.conf

rm /etc/modprobe.d/8192cu-disable-power-management.conf

dkms remove 8192cu/1.11 --all

If you're using other Linux distribution, like redhat-based, you may need to modify the above commands slightly.  You have to consult your OS for the appropriated substitute commands.

Enjoy!


Technical Support Team
Edimax USA
Santa Clara, CA



/*** EOF ***/
Created:  2016-06-29  10:29 AM
Modified:  2018-03-27  9:51 AM

--------------------------------------------------------------------------------

https://ubuntuforums.org/showthread.php?t=2355826

Did you blacklist the original drivers (there are two of them now!)?

Code:

echo -e "blacklist rtl8192cu\nblacklist rtl8xxxu" | sudo tee -a /etc/modprobe.d/blacklist.conf

There is a newer driver available:

Code:

sudo apt-get install --reinstall linux-headers-$(uname -r) linux-headers-generic build-essential dkms git
sudo git clone https://github.com/vincent-t/rt8192cu_dkms /usr/src/8192cu-4.0.2.9000.20130911
sudo dkms add -m 8192cu -v 4.0.2.9000.20130911
sudo dkms build -m 8192cu -v 4.0.2.9000.20130911
sudo dkms install -m 8192cu -v 4.0.2.9000.20130911

Uninstall the old one first 
