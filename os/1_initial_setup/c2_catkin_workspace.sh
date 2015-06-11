#!/usr/bin/env bash

ros_version=${1:-"hydro"}
catkin_folder=${2:-"$HOME/catkin_ws"}
setup_environment=${3:-"false"}
user_name=${4:-"$USER"}



echo "####################################################################################################"
echo "##### Creating ROS catkin workspace (http://wiki.ros.org/catkin/Tutorials/create_a_workspace)"
echo "####################################################################################################"

source /opt/ros/${ros_version}/setup.bash

mkdir -p ${catkin_folder}/src
cd ${catkin_folder}/src
catkin_init_workspace


cd ${catkin_folder}
catkin_make


if [ "${setup_environment}" = true ]; then
	echo "# <ROS catkin setup.bash>" >> /home/${user_name}/.bashrc
	echo "source ${catkin_folder}/devel/setup.bash" >> /home/${user_name}/.bashrc
	echo "alias ctkmake='catkin_make -C ${catkin_folder}/'" >> /home/${user_name}/.bashrc
	echo "# </ROS catkin setup.bash>" >> /home/${user_name}/.bashrc
fi


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
