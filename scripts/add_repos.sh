#!/bin/bash

# Dell repos
sudo gpg --keyserver pool.sks-keyservers.net --recv-key 1285491434D8786F;
gpg -a --export 1285491434D8786F | sudo apt-key add - ;

# Freetype repos
sudo add-apt-repository ppa:glasen/freetype2

# Numix, Openbox Theme repos
sudo add-apt-repository ppa:numix/ppa

# The firefox repo
sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora

# The Sublime repo
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# The spotify repo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# The Mono framework repo (MS .NET)
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo apt install apt-transport-https
echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

# The ALSA audio driver repo.
sudo add-apt-repository ppa:ubuntu-audio-dev/alsa-daily`

sudo apt-get update;
