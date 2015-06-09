#!/bin/sh

echo "####################################################################################################"
echo "##### Pairing joystick (http://wiki.ros.org/ps3joy/Tutorials/PairingJoystickAndBluetoothDongle)"
echo "####################################################################################################"


sudo su
source /opt/ros/indigo/setup.bash
rosrun ps3joy sixpair


echo "--------------------------------------------------------------------"
echo "--- To use the joystick run:"
echo "sudo su"
echo "source /opt/ros/indigo/setup.bash"
echo "rosrun ps3joy ps3joy.py"
