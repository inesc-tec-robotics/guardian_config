#!/bin/bash


#########################################################################################
# ROS setup during boot
# add the following lines to /etc/rc.local in order to automatically start the ros nodes at boot:
# /home/guardian/guardian_ws/src/guardian_config/os/boot.sh
# exit 0
#########################################################################################


# setup environment for guardian user (sudo -u guardian command -> requires password)
export USER=guardian
export HOME=/home/guardian
export LOGNAME=guardian
export ROS_HOME=/home/guardian/.ros


# ros environment
source /home/guardian/guardian_ws/src/guardian_config/os/ros.bash


# if the roscore is in another computer, uncomment the next line in order to wait for roscore to startup
#until rostopic list ; do sleep 1; done


# guardian nodes
roslaunch guardian_config guardian.launch --screen -v > /home/guardian/.ros/log/guardian.log 2>&1 &



# use the following command to follow the output of the running nodes
# tailf -n 100000 /home/guardian/.ros/log/guardian.log

# use the following command to visual monitor the running nodes (mount /home/guardian with nfs)
# rosrun rviz rviz -d /home/guardian/guardian_ws/src/guardian_config/rviz/guardian.rviz
