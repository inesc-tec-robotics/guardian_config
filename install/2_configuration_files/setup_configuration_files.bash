#!/usr/bin/env bash

user_name=${1:-"$USER"}
ros_version=${2:-"hydro"}
catkin_folder=${3:-"/home/${user_name}/catkin_ws"}

script_dir="$(dirname "$(readlink -e "${BASH_SOURCE[0]}")" && echo X)" && script_dir="${script_dir%$'\nX'}"


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Setting up udev rules"
echo "####################################################################################################"

sudo cp "${script_dir}/49-carlos-hardware.rules" "/etc/udev/rules.d/49-carlos-hardware.rules"
sudo service udev restart

echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"



echo -e "\n\n"
echo "####################################################################################################"
echo "##### Setting up joy stick daemon"
echo "##### Check the configurations in /etc/init.d/ps3joy and rerun this command: sudo update-rc.d ps3joy defaults 99 99"
echo "####################################################################################################"

sudo cp "${script_dir}/ps3joy" "/etc/init.d/ps3joy"
sudo update-rc.d ps3joy defaults 99 99

echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"



echo -e "\n\n"
echo "####################################################################################################"
echo "##### Setting boot script"
echo "####################################################################################################"

sudo sh -c "echo '${catkin_folder}/src/guardian_config/install/2_configuration_files/boot.bash ${ros_version} ${user_name} ${catkin_folder}' > /etc/rc.local"
sudo sh -c "echo 'exit 0' >> /etc/rc.local"
sudo mkdir /home/${user_name}/.ros/log/

echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"



echo -e "\n\n"
echo "####################################################################################################"
echo "##### Setting up .bashrc"
echo "####################################################################################################"

mkdir -p "/home/${user_name}/.ros/config/"
cp "${script_dir}/rosconsole.config" "/home/${user_name}/.ros/config/rosconsole.config"
echo "source ${catkin_folder}/src/guardian_config/install/2_configuration_files/ros.bash ${ros_version} ${user_name} ${catkin_folder}" >> /home/${user_name}/.bashrc

echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
