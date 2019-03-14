Previously we had the symantec input setup. This allowed us to have a single left click while retaining the double finger tap to activate right click. Unfortunately symantec has crap palm rejection.

We are now using libinput. We've created the following file: `/usr/share/X11/xorg.conf.d/40-libinput.conf`

In symantec we can disable the right click by remapping the right click area. In libinput we need to try something else.

Here is the commands to remap and turn off the middle and right mouse clicks on the pad. However, this also disables two finger tapping.
`$ xinput list`
`$ xinput --get-button-map [id]`
`$ xinput --set-button-map 12 1 0 0 4 5 6 7`
`$ xinput --set-button-map 16 1 0 0 4 5 6 7`

From this article you can see that "ClickMethod":"clickfinger" is the property to use for `libinput`
https://bbs.archlinux.org/viewtopic.php?id=197572

Here is the configuration for 40-libinput.conf
```
# Match on all types of devices but tablet devices and joysticks.
Section "InputClass"
  Identifier "libinput pointer catchall"
  MatchIsPointer "on"
  MatchDevicePath "/dev/input/event*"
  Driver "libinput"
EndSection

Section "InputClass"
  Identifier "libinput keyboard catchall"
  MatchIsKeyboard "on"
  MatchDevicePath "/dev/input/event*"
  Driver "libinput"
EndSection

Section "InputClass"
  Identifier "libinput touchpad catchall"
  MatchIsTouchpad "on"
  MatchDevicePath "/dev/input/event*"
  Driver "libinput"
  Option "Tapping" "True"
  Option "NaturalScrolling" "True"
  Option "HorizontalScrolling" "True"
  #Option "TappingButtonMap" "lmr"
  Option "ClickMethod" "clickfinger"
EndSection
```

