#!/usr/bin/env sh


echo "####################################################################################################"
echo "##### Enabling VNC remote3 desktop"
echo "####################################################################################################"

DISPLAY=:0 gsettings set org.gnome.Vino enabled true
DISPLAY=:0 gsettings set org.gnome.Vino require-encryption false
DISPLAY=:0 gsettings set org.gnome.Vino prompt-enabled false


echo "\n\n"
echo "----------------------------------------------------------------------------------------------------"
echo ">>>>> Update finished"
echo "----------------------------------------------------------------------------------------------------"
