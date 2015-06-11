#!/usr/bin/env bash

echo "####################################################################################################"
echo "##### Installing system dependencies..."
echo "####################################################################################################"

ros_version=${1:-"$(rosversion -d)"}


sudo apt-get install libopencv-dev -y

sudo apt-get install ros-${ros_version}-teleop-twist-joy -y
sudo apt-get install ros-${ros_version}-teleop-twist-keyboard -y
sudo apt-get install ros-${ros_version}-pr2-common -y
sudo apt-get install ros-${ros_version}-joy -y
sudo apt-get install ros-${ros_version}-joystick-drivers -y
sudo apt-get install ros-${ros_version}-ros-control -y
sudo apt-get install ros-${ros_version}-ros-controllers -y

sudo apt-get install ros-${ros_version}-gmapping -y
sudo apt-get install ros-${ros_version}-hector-mapping -y

sudo apt-get install ros-${ros_version}-hector-gazebo-plugins -y
sudo apt-get install ros-${ros_version}-base-local-planner -y
sudo apt-get install ros-${ros_version}-amcl -y
sudo apt-get install ros-${ros_version}-serial -y
sudo apt-get install ros-${ros_version}-move-base -y


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
