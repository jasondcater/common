We used to set the DPI for the system with the xinit flag -DPI=140
`exec /usr/bin/X -nolisten tcp "$@" -dpi 140`

The following below seems to work better for this screen. 

From https://wiki.gnome.org/BrionVibber/HiDpiNotes

Testing

(Updating this to Fedora Workstation 21 alpha under VMWare Fusion 7... will update rest of page later.)

I am testing on a 15" Retina MacBook Pro (2880x1800 display), with Fedora 20 + Gnome 3.12 prerelease packages in Parallels 9. Will also test on a bare install to rule out Parallels video driver for some issues.

If your system doesn't pick up the high resolution mode by default, run:

    $ gsettings set org.gnome.desktop.interface scaling-factor 2 

and restart the desktop.

Do not try to just adjust GDK_SCALE environment variable, that doesn't cover everything properly.

Also testing with a direct install of Fedora 20 on Dell XPS 13 'Sputnik 2' -- this has a 1920x1080 13" screen, so at 2x scaling things are too big to use comfortably but at 1x they're too small. To approximate 1.5x scaling, set the GNOME scaling factor to 2 as above and also scale the screen up virtually:

    $ xrandr --output eDP1 --scale-from 2560x1440 --panning 2560x1440 

This will be slightly blurry as drawing is done at 2560x1440 and scaled down to 1920x1080 in the display, but will exercise all the 2x scaled code paths and approximates the on-screen size of a full 2x-density display. 
