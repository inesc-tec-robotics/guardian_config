#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Pairing joystick (http://wiki.ros.org/ps3joy/Tutorials/PairingJoystickAndBluetoothDongle)"
echo "####################################################################################################"

ros_version=${1:-"hydro"}

sudo su
source /opt/ros/${ros_version}/setup.bash
rosrun ps3joy sixpair


echo "--------------------------------------------------------------------"
echo "--- To use the joystick run:"
echo "sudo su"
echo "source /opt/ros/${ros_version}/setup.bash"
echo "rosrun ps3joy ps3joy.py"


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
