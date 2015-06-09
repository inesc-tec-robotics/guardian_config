#!/bin/sh

echo "####################################################################################################"
echo "##### Checking and installing dependencies"
echo "####################################################################################################"


roscd
cd ..

sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update

sudo apt-get install libpcl-all-dev -y

sudo apt-get install ros-indigo-pcl-ros ros-indigo-pcl-conversions ros-indigo-angles -y										# required
sudo apt-get install ros-indigo-gazebo-ros ros-indigo-gazebo-msgs -y														# optional for ground truth from gazebo simulator
sudo apt-get install ros-indigo-octomap ros-indigo-octomap-ros ros-indigo-octomap-msgs ros-indigo-octomap-rviz-plugins -y	# optional for dynamic map update
sudo apt-get install ros-indigo-dynamic-edt-3d ros-indigo-octovis -y														# optional for dynamic map update
sudo apt-get install libopenthreads-dev libopenscenegraph-dev -y															# optional for mesh_to_pointcloud


rosdep update
rosdep check --from-paths src --ignore-src --rosdistro=indigo
rosdep install --from-paths src --ignore-src --rosdistro=indigo


echo "--------------------------------------------------------------------"
echo "--- Remaining dependencies that must be manually checked"

rosdep check --from-paths src --ignore-src --rosdistro=indigo


echo "\n\n"
echo "----------------------------------------------------------------------------------------------------"
echo ">>>>> Installation of dependencies finished"
echo "----------------------------------------------------------------------------------------------------"
