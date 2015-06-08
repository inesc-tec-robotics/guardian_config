#!/bin/sh

echo "####################################################################################################"
echo "##### Installing dependencies..."
echo "####################################################################################################"


sudo apt-get install libopencv-dev -y

sudo apt-get install ros-indigo-teleop-twist-joy -y
sudo apt-get install ros-indigo-teleop-twist-keyboard -y
sudo apt-get install ros-indigo-pr2-common -y
sudo apt-get install ros-indigo-joy -y
sudo apt-get install ros-indigo-joystick-drivers -y
sudo apt-get install ros-indigo-ros-control -y
sudo apt-get install ros-indigo-ros-controllers -y

sudo apt-get install ros-indigo-gmapping -y
sudo apt-get install ros-indigo-hector-mapping -y

sudo apt-get install ros-indigo-hector-gazebo-plugins -y
sudo apt-get install ros-indigo-base-local-planner -y
sudo apt-get install ros-indigo-amcl -y
sudo apt-get install ros-indigo-serial -y
sudo apt-get install ros-indigo-move-base -y



roscd robotnik_tilt_laser
cd external/dxl_sdk_2.0_for_linux/src/
make
sudo make install



echo "--------------------------------------------------------------------"
echo "--- Remaining dependencies that must be manually checked"

roscd
cd ..

rosdep update
rosdep check --from-paths src --ignore-src --rosdistro=indigo
