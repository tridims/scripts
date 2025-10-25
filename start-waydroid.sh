#!/bin/bash

sudo ufw disable

sudo systemctl start waydroid-container

waydroid session start

sudo systemctl stop waydroid-container

sudo ufw enable
