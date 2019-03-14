https://askubuntu.com/questions/134371/how-do-i-set-default-view-to-list-in-nautilus-file-manager
for everyone who likes to do things by terminal changing the settings for nautilus can be done by

gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

If you need to find out which settings are applied to nautilus you can go

gsettings get org.gnome.nautilus.preferences default-folder-viewer

The credits for this post go to: https://scivision.co/ubuntu-setting-nautilus-default-view-to-detailed-list-view/
