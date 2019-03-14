#!/bin/bash

sudo ufw deny PlexMediaServer;
sudo systemctl stop plexmediaserver.service;

