#!/usr/bin/env bash

ros_version=${1:-"hydro"}
user_name=${2:-"guardian"}
catkin_folder=${3:-"/home/${user_name}/catkin_ws"}


#######################################################################################################################
# ROS setup
# add the following line to /home/${user_name}/.bashrc in order to setup the ros environment when using a terminal / ssh
# source ${catkin_folder}/src/guardian_config/install/2_configuration_files/ros.bash
#######################################################################################################################


# <ROS local network setup>
#export ROS_MASTER_URI=http://localhost:11311
#export ROS_HOSTNAME=localhost
# </ROS local network setup>


# <ROS remote network setup>
#export ROS_MASTER_URI=http://master_ip:11311
#export ROS_IP=local_ip
# <ROS remote network setup>


# <ROS setup>
export ROSCONSOLE_FORMAT='[${severity}] [${node}] [${time}]: ${message} | ${file}:${function}:${line}'
export ROSCONSOLE_CONFIG_FILE=/home/${user_name}/.ros/config/rosconsole.config
export ROS_PARALLEL_JOBS='-j4 -l4'
source /opt/ros/${ros_version}/setup.bash
# </ROS setup>


# <ROS catkin setup>
source ${catkin_folder}/devel/setup.bash
alias ctkmake='catkin_make -C ${catkin_folder}'
# </ROS catkin setup>
