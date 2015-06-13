#!/usr/bin/env bash

ros_version=${1:-"hydro"}
setup_environment=${2:-"false"}
user_name=${3:-"$USER"}


echo "####################################################################################################"
echo "##### Installing ROS ${ros_version} (http://wiki.ros.org/${ros_version}/Installation/Ubuntu)"
echo "####################################################################################################"


echo -e "\n\n"
echo "------------------------------------------------"
echo ">>>>> Setting up sources.list"
echo "------------------------------------------------"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'



echo -e "\n\n"
echo "------------------------------------------------"
echo ">>>>> Setting keys"
echo "------------------------------------------------"
if [ "${ros_version}" = "hydro" ]; then
	wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
else
	sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
fi



echo -e "\n\n"
echo "------------------------------------------------"
echo ">>>>> Updating packages index"
echo "------------------------------------------------"
sudo apt-get update



echo -e "\n\n"
echo "------------------------------------------------"
echo ">>>>> Installing ROS"
echo "------------------------------------------------"

if [ "$(lsb_release -sd)" = "Ubuntu 14.04.2 LTS" ]; then
	sudo apt-get install xserver-xorg-dev-lts-utopic mesa-common-dev-lts-utopic libxatracker-dev-lts-utopic libopenvg1-mesa-dev-lts-utopic libgles2-mesa-dev-lts-utopic libgles1-mesa-dev-lts-utopic libgl1-mesa-dev-lts-utopic libgbm-dev-lts-utopic libegl1-mesa-dev-lts-utopic -y
fi

# >>> Desktop-Full Install (Recommended)
sudo apt-get install ros-${ros_version}-desktop-full -y



echo -e "\n\n"
echo "------------------------------------------------"
echo ">>>>> Initializing rosdep"
echo "------------------------------------------------"
sudo rosdep init
rosdep update


if [ "${setup_environment}" = true ]; then
	echo -e "\n\n"
	echo "------------------------------------------------"
	echo ">>>>> Setting up environment"
	echo "------------------------------------------------"
	echo "# <ROS setup.bash>" >> /home/${user_name}/.bashrc
	echo "source /opt/ros/${ros_version}/setup.bash" >> /home/${user_name}/.bashrc
	echo "# </ROS setup.bash>" >> /home/${user_name}/.bashrc
fi

source /opt/ros/${ros_version}/setup.bash


echo -e "\n\n"
echo "------------------------------------------------"
echo ">>>>> Installing remaining packages"
echo "------------------------------------------------"
sudo apt-get install python-rosinstall -y


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
