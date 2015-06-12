#!/usr/bin/env bash

echo "####################################################################################################"
echo "##### Installing guardian sw..."
echo "####################################################################################################"

ros_version=${1:-"$(rosversion -d)"}
default_branch_name=${2:-"hydro-devel"}
catkin_folder=${3:-"$HOME/catkin_ws"}

source /opt/ros/${ros_version}/setup.bash

cd ${catkin_folder}/src

echo -e "\n\n"
echo "--------------------------------------------------------------------"
echo "--- Cloning RobotnikAutomation packages"
git clone -b ${default_branch_name} https://github.com/RobotnikAutomation/rly_08.git


echo -e "\n\n"
echo "--------------------------------------------------------------------"
echo "--- Cloning inesc-tec-robotics packages"
git clone -b master https://github.com/inesc-tec-robotics/crob_gazebo_models.git
git clone -b ${default_branch_name} https://github.com/inesc-tec-robotics/gazebo_projection_mapping.git
git clone -b ${default_branch_name} https://github.com/inesc-tec-robotics/guardian_config.git
git clone -b ${default_branch_name} https://github.com/inesc-tec-robotics/guardian_ros_pkg.git
git clone -b ${default_branch_name} https://github.com/inesc-tec-robotics/robotnik_tilt_laser.git
git clone -b indigo-devel https://github.com/inesc-tec-robotics/um7.git


cd robotnik_tilt_laser/external/dxl_sdk_2.0_for_linux/src/
make
sudo make install
cd ${catkin_folder}/src


echo -e "\n\n"
echo "--------------------------------------------------------------------"
echo "--- Cloning localization packages"
git clone -b ${default_branch_name} https://github.com/inesc-tec-robotics/dynamic_robot_localization.git
./dynamic_robot_localization/install/setup.sh


echo -e "\n\n"
echo "--------------------------------------------------------------------"
echo "--- Cloning navigation packages"
echo "---> TODO <---"


cd ${catkin_folder}
rosdep update

echo -e "\n\n"
echo "--------------------------------------------------------------------"
echo "--- Installing packages dependencies"
rosdep check --from-paths src --ignore-src --rosdistro=${ros_version}
rosdep install --from-paths src --ignore-src --rosdistro=${ros_version} -y

echo -e "\n\n"
echo "--------------------------------------------------------------------"
echo "--- Remaining dependencies that must be manually checked"
rosdep check --from-paths src --ignore-src --rosdistro=${ros_version}


echo -e "\n\n"
echo "--------------------------------------------------------------------"
echo "--- Building catkin workspace"
cd ${catkin_folder}
catkin_make


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
