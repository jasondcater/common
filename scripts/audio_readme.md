## Get info on your sound cards.

### Lowlevel from the PCI bus. (Is the hardware even there?)
`$ lspci -nnk | grep -A2 Audio`

### List the modules/drivers loaded by the system.
`$ lsmod | grep snd`

### Next level up. (Are there any cards setup by the system?)
`$ cat /proc/asound/cards`
`$ ls /dev/snd`

### Software level. (Can the user space apps see the cards?)
`$ aplay -l`
`$ aplay -L`

### A list of audio hardware/drivers supported by ALSA
`$ cat /usr/share/doc/alsa-base/driver/HD-Audio-Models.txt.gz`

## Updating the audio stack.

### Install the ALSA audio driver.
`$ sudo add-apt-repository ppa:ubuntu-audio-dev/alsa-daily`
`$ sudo apt-get update`
`$ sudo apt-get install oem-audio-hda-daily-dkms`

### Remove the ALSA and Pulse audio software.
`$ sudo apt-get remove --purge alsa-base`
`$ sudo apt-get remove --purge pulseaudio`

### Rebuild the ALSA and Pulse audio software.
`$ sudo apt-get install alsa-base`
`$ sudo apt-get install pulseaudio`
`$ sudo alsa force-reload`

### Load the intel audio driver.
`$ sudo modprobe snd-hda-intel`

## Configure ALSA
Make sure the following line is included at the end of the `/etc/modprobe.d/alsa-base.conf`.

This option give us the bare minimum functionality.
```
options snd-hda-intel model=generic
```

These options give us proper audio support.
```
options snd-hda-intel single_cmd=1
options snd-hda-intel probe_mask=1
options snd-hda-intel model=headset-mic
```

Then run...
`$ sudo alsa force-reload`

...and restart.

sudo sh -c 'echo "snd-hda-intel" >> /etc/modules'

Now, reboot, you shoud now SEE (but maybe not yet hear) your soundcard.
Give a try to:
cat /proc/asound/cards
and see if any card is listed...

https://ubuntuforums.org/showthread.php?t=1316634
://www.dell.com/community/Linux-Developer-Systems/XPS-13-no-soundcard-detected/td-p/5062800ttps://ubuntuforums.org/showthread.php?t=1316634
s

https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1575078/comments/23
