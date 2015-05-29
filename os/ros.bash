#!/usr/bin/env bash

#######################################################################################################################
# ROS setup
# add the following line to /home/guardian/.bashrc in order to setup the ros environment when using a terminal / ssh
# source /home/guardian/guardian_ws/src/guardian_config/os/ros.bash
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
#export ROSCONSOLE_FORMAT='[${severity}] [${time}]: ${message}'
export ROSCONSOLE_CONFIG_FILE=/home/guardian/.ros/rosconsole.config
export ROS_PARALLEL_JOBS='-j4 -l4'
source /opt/ros/hydro/setup.bash
# </ROS setup>


# <ROS catkin setup>
source /home/guardian/guardian_ws/devel/setup.bash
alias ctkmake='catkin_make -C $HOME/guardian_ws'
# </ROS catkin setup>
