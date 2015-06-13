#!/usr/bin/env bash

echo "####################################################################################################"
echo "##### Pairing joystick (http://wiki.ros.org/ps3joy/Tutorials/PairingJoystickAndBluetoothDongle)"
echo "####################################################################################################"

ros_version=${1:-"hydro"}

read -p "PS3 joystick plugged in USB port for pairing (y/n)? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo service bluetooth restart
	sudo bash -c "source /opt/ros/${ros_version}/setup.bash && rosrun ps3joy sixpair"
	
	echo -e "\n\n"
	echo "--------------------------------------------------------------------"
	echo "--- If ps3joy.py is not running as daemon (recommended) use the following command:"
	echo 'sudo bash -c "source /opt/ros/${ros_version}/setup.bash && rosrun ps3joy ps3joy.py" &'
	echo "--- To use test the joystick connection run:"
	echo "sudo jstest /dev/input/js?"
	
	echo -e "\n\n"
	echo "####################################################################################################"
	echo "##### Finished"
	echo "####################################################################################################"
else
	echo -e "\n\n"
	echo "####################################################################################################"
	echo "##### Pairing aborted"
	echo "####################################################################################################"
fi

