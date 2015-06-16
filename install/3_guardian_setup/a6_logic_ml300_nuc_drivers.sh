#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Installing latest Intel Wireless 7260 driver (https://wireless.wiki.kernel.org/en/users/Drivers/iwlwifi)"
echo "####################################################################################################"

cd ~
mkdir drivers
cd drivers
wget https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi-7260-ucode-22.24.8.0.tgz
tar zxvf iwlwifi-7260-ucode-22.24.8.0.tgz
cd iwlwifi-7260-ucode-22.24.8.0

sudo cp iwlwifi-*.ucode /lib/firmware

cd ~
rm -rf drivers



echo "####################################################################################################"
echo "##### Installing Intel drivers"
echo "####################################################################################################"

sudo apt-get install xserver-xorg-video-intel-lts-trusty -y
sudo apt-get install mesa-utils -y

