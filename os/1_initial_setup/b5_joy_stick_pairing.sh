#!/bin/sh

echo "####################################################################################################"
echo "##### Pairing joystick (http://wiki.ros.org/ps3joy/Tutorials/PairingJoystickAndBluetoothDongle)"
echo "####################################################################################################"


sudo su
source /opt/ros/indigo/setup.bash
rosrun ps3joy sixpair


echo "--------------------------------------------------------------------"
echo "--- To use the joystick use:"
echo "source /opt/ros/indigo/setup.bash"
echo "sudo su"
echo "rosrun ps3joy ps3joy.py"


