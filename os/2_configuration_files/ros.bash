#!/usr/bin/env bash

#######################################################################################################################
# ROS setup
# add the following line to /home/guardian/.bashrc in order to setup the ros environment when using a terminal / ssh
# source /home/guardian/catkin_ws/src/guardian_config/os/2_configuration_files/ros.bash
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
export ROSCONSOLE_CONFIG_FILE=/home/guardian/.ros/rosconsole.config
export ROS_PARALLEL_JOBS='-j4 -l4'
source /opt/ros/indigo/setup.bash
# </ROS setup>


# <ROS catkin setup>
source /home/guardian/catkin_ws/devel/setup.bash
alias ctkmake='catkin_make -C /home/guardian/catkin_ws'
# </ROS catkin setup>
