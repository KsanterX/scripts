#!/bin/bash

#Fix Manjaro's "Failed to start Light Display Manager" (Hyper-V)

sudo pacman -Sy
sudo pacman -S xf86-video-fbdev
sudo systemctl start lightdm
