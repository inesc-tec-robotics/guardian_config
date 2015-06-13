#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Installing system dependencies..."
echo "####################################################################################################"

ros_version=${1:-"$(rosversion -d)"}


sudo apt-get install libopencv-dev -y

sudo apt-get install ros-${ros_version}-base-local-planner -y
sudo apt-get install ros-${ros_version}-fake-localization -y
sudo apt-get install ros-${ros_version}-gmapping -y
sudo apt-get install ros-${ros_version}-hector-gazebo-plugins -y
sudo apt-get install ros-${ros_version}-hector-mapping -y
sudo apt-get install ros-${ros_version}-hector-trajectory-server -y
sudo apt-get install ros-${ros_version}-hokuyo-node -y
sudo apt-get install ros-${ros_version}-joy -y
sudo apt-get install ros-${ros_version}-joystick-drivers -y
sudo apt-get install ros-${ros_version}-map-server -y
sudo apt-get install ros-${ros_version}-move-base -y
sudo apt-get install ros-${ros_version}-openni-launch -y
sudo apt-get install ros-${ros_version}-openni2_launch -y
sudo apt-get install ros-${ros_version}-pr2-common -y
sudo apt-get install ros-${ros_version}-ps3joy -y
sudo apt-get install ros-${ros_version}-robot-localization -y
sudo apt-get install ros-${ros_version}-robot-state-publisher -y
sudo apt-get install ros-${ros_version}-ros-control -y
sudo apt-get install ros-${ros_version}-ros-controllers -y
sudo apt-get install ros-${ros_version}-rosbag -y
sudo apt-get install ros-${ros_version}-roslint -y
sudo apt-get install ros-${ros_version}-serial -y
sudo apt-get install ros-${ros_version}-tf -y
sudo apt-get install ros-${ros_version}-tf2 -y
sudo apt-get install ros-${ros_version}-teleop-twist-joy -y
sudo apt-get install ros-${ros_version}-teleop-twist-keyboard -y
sudo apt-get install ros-${ros_version}-topic-tools -y
sudo apt-get install ros-${ros_version}-urg-node -y


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
