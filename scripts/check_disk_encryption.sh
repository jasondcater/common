#!/bin/bash

DEV_LUKS=/dev/nvme0n1p4

cryptsetup isLuks $DEV_LUKS && echo "$DEV_LUKS is a LUKS Device" || echo "$DEV_LUKS is not a LUKS Device"
test -b /dev/disk/by-id/dm-uuid-*$(cryptsetup luksUUID $DEV_LUKS | tr -d -)* && echo "$DEV_LUKS is opened" || echo "$DEV_LUKS is not opened"

