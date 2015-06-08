#!/bin/sh

echo "####################################################################################################"
echo "##### Installing ROS Groovy (http://wiki.ros.org/indigo/Installation/Ubuntu)"
echo "####################################################################################################"


echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Setting up sources.list"
echo "------------------------------------------------"

# >>> Ubuntu 14.04
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'



echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Setting keys"
echo "------------------------------------------------"
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -



echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Updating packages index"
echo "------------------------------------------------"
sudo apt-get update



echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Installing ROS"
echo "------------------------------------------------"


sudo apt-get install xserver-xorg-dev-lts-utopic mesa-common-dev-lts-utopic libxatracker-dev-lts-utopic libopenvg1-mesa-dev-lts-utopic libgles2-mesa-dev-lts-utopic libgles1-mesa-dev-lts-utopic libgl1-mesa-dev-lts-utopic libgbm-dev-lts-utopic libegl1-mesa-dev-lts-utopic -y

# >>> Desktop-Full Install (Recommended)
sudo apt-get install ros-indigo-desktop-full -y



echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Initializing rosdep"
echo "------------------------------------------------"
sudo rosdep init
rosdep update



echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Setting up environment"
echo "------------------------------------------------"
echo "# <ROS indigo setup.bash>" >> ~/.bashrc
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
echo "# </ROS indigo setup.bash>" >> ~/.bashrc
source /opt/ros/indigo/setup.bash


echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Installing remaining packages"
echo "------------------------------------------------"
sudo apt-get install python-rosinstall -y
