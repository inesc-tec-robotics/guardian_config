#!/bin/bash


#########################################################################################
# ROS setup during boot
# add the following lines to /etc/rc.local in order to automatically start the ros nodes at boot:
# /home/guardian/guardian_ws/src/guardian_config/os/boot.sh
# exit 0
#########################################################################################


source /home/guardian/guardian_ws/src/guardian_config/os/ros.bash
roslaunch guardian_config guardian.launch &
