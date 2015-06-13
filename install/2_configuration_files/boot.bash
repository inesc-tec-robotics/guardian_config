#!/usr/bin/env bash

ros_version=${1:-"hydro"}
user_name=${2:-"guardian"}
catkin_folder=${3:-"/home/${user_name}/catkin_ws"}


#########################################################################################
# ROS setup during boot
# add the following lines to /etc/rc.local in order to automatically start the ros nodes at boot:
# ${catkin_folder}/src/guardian_config/install/2_configuration_files/boot.bash
# exit 0
#########################################################################################


# setup environment for guardian user
export USER=${user_name}
export HOME=/home/${user_name}
export LOGNAME=${user_name}
export ROS_HOME=/home/${user_name}/.ros


# ros environment
source ${catkin_folder}/src/guardian_config/install/2_configuration_files/ros.bash


# if the roscore is in another computer, uncomment the next line in order to wait for roscore to startup
#until rostopic list ; do sleep 1; done


# guardian nodes
roslaunch guardian_config guardian.launch --screen -v > /home/guardian/.ros/log/guardian.log 2>&1 &



# use the following command to follow the output of the running nodes
# tailf -n 100000 /home/${user_name}/.ros/log/guardian.log

# use the following command to visual monitor the running nodes (mount /home/guardian with nfs)
# rosrun rviz rviz -d /home/${user_name}/catkin_ws/src/guardian_config/rviz/guardian.rviz
