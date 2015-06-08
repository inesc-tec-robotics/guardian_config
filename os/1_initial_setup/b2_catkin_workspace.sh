#!/bin/sh

echo "####################################################################################################"
echo "##### Creating ROS catkin workspace (http://wiki.ros.org/catkin/Tutorials/create_a_workspace)"
echo "####################################################################################################"

source /opt/ros/indigo/setup.bash

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace


cd ~/catkin_ws/
catkin_make


echo "# <ROS catkin setup.bash>" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "alias ctkmake='catkin_make -C $HOME/catkin_ws/'" >> ~/.bashrc
echo "# </ROS catkin setup.bash>" >> ~/.bashrc
source ~/catkin_ws/devel/setup.bash
