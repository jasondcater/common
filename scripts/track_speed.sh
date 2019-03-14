#xinput --list --short;
#xinput --list-props "DLL07BF:01 06CB:7A13 Touchpad" | grep 'Accel';

# Where 12 is the id from "DLL07BF:01 06CB:7A13 Touchpad" and 236 is the
# property id. 1.5 is the speed factor. Lower equals faster, default is 2.5
xinput --set-prop 12 263 1.5;

