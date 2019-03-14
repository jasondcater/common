#!/bin/bash

# For whatever reason the Ctrl+Home & Ctrl+End keys when set on the arrow keys
# point in opposite directions for normal UI navigation. Normally when you
# Ctrl+Home or Ctrl+End (it is mapped to the left and right arrow keys) the 
# behavior takes you up and down the page. AND when you Ctrl+PgUp and Ctrl+PgDn
# (it is mapped to the up and down arrow keys) the UI takes you horizontally
# across the tabs. This makes no sense from a UI perspective. The following line
# below remaps those keys so the direction on the keys matches the direction on 
# the UI.

# https://jb-blog.readthedocs.io/en/latest/posts/0002-keyboard-remap.html
# $ sudo showkey --scancodes
# $ sudo showkey --keycodes

# Home
#   keycode 102
#   scancode ^[[H0xe0 0x47 0xe0 0xc7 
# 
# End
#   keycode 107
#   scancode ^[[F0xe0 0x4f 0xe0 0xcf 
# 
# Page Up
#   keycode 104
#   scancode ^[[5~0xe0 0x49 0xe0 0xc9 
# 
# Page Down
#   keycode 109
#   scancode ^[[6~0xe0 0x51 0xe0 0xd1

sudo setkeycodes e047 104 e04f 109 e049 102 e051 107;
