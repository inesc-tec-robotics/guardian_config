#!/usr/bin/env bash

ros_version=${1:-"hydro"}
user_name=${2:-"guardian"}
catkin_folder=${3:-"/home/${user_name}/catkin_ws"}
using_projection_mapping=${4:-"true"}


#########################################################################################
# ROS setup during boot
# add the following lines to /etc/rc.local in order to automatically start the ros nodes at boot:
# ${catkin_folder}/src/guardian_config/install/2_configuration_files/boot.bash
# exit 0
#########################################################################################

# setup environment for guardian user
export DISPLAY=:0
export USER=${user_name}
export HOME=/home/${user_name}
export LOGNAME=${user_name}
export ROS_HOME=/home/${user_name}/.ros


# ros environment
source ${catkin_folder}/src/guardian_config/install/2_configuration_files/ros.bash ${ros_version} ${user_name} ${catkin_folder}


# if the roscore is in another computer, uncomment the next line in order to wait for roscore to startup
#until rostopic list ; do sleep 1; done


# guardian nodes
roslaunch guardian_config guardian.launch --screen -v &> /home/guardian/.ros/log/guardian.log &

if [ "${using_projection_mapping}" = true ]; then
	until wmctrl -r /virtual_camera/image_raw -b toggle,fullscreen ; do sleep 1; done
fi


# use the following command to follow the output of the running nodes
# tailf -n 100000 /home/${user_name}/.ros/log/guardian.log

# use the following command to visual monitor the running nodes (mount /home/guardian with nfs)
# rosrun rviz rviz -d /home/${user_name}/catkin_ws/src/guardian_config/rviz/guardian.rviz
