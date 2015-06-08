#!/bin/bash

sudo cp 49-carlos-hardware.rules /etc/udev/rules.d/
sudo service udev restart

sudo cp ps3joy /etc/init.d/
sudo update-rc.d ps3joy defaults 99 99
