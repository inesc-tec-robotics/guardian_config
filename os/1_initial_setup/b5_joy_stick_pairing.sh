#!/bin/sh

echo "####################################################################################################"
echo "##### Pairing joystick (http://wiki.ros.org/ps3joy/Tutorials/PairingJoystickAndBluetoothDongle)"
echo "####################################################################################################"


sudo bash
rosrun ps3joy sixpair


echo "--------------------------------------------------------------------"
echo "--- To use the joystick use:"
echo "sudo bash"
echo "rosrun ps3joy ps3joy.py"


