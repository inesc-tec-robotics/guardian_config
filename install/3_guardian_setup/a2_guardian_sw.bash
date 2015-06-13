#!/usr/bin/env bash

echo "####################################################################################################"
echo "##### Installing guardian sw..."
echo "####################################################################################################"

ros_version=${1:-"$(rosversion -d)"}
default_branch_name=${2:-"hydro-devel"}
catkin_folder=${3:-"$HOME/catkin_ws"}

source /opt/ros/${ros_version}/setup.bash

cd ${catkin_folder}/src

function clone_git_repository() {
	repository_host=${1:?'Must specify repository host'}
	repository_name=${2:?'Must specify repository name'}
	branch=${3:?'Must specify repository branch'}
	ls "${repository_name}" &> /dev/null
	if [ $? -ne 0 ]; then
		echo -e "\n"
		echo "-------------------------------------------"
		echo "==> Cloning ${repository_name} (branch: ${branch})"
		git clone -b ${branch} "${repository_host}/${repository_name}.git"
	else
		cd ${repository_name}
		git pull
		cd ..
	fi
}


echo -e "\n\n"
echo "===================================================================="
echo "=== Cloning RobotnikAutomation packages"
clone_git_repository "https://github.com/RobotnikAutomation" "rly_08" "${default_branch_name}"


echo -e "\n\n"
echo "===================================================================="
echo "=== Cloning inesc-tec-robotics packages"
clone_git_repository "https://github.com/inesc-tec-robotics" "crob_gazebo_models" "master"
clone_git_repository "https://github.com/inesc-tec-robotics" "gazebo_projection_mapping" "${default_branch_name}"
clone_git_repository "https://github.com/inesc-tec-robotics" "guardian_config" "${default_branch_name}"
clone_git_repository "https://github.com/inesc-tec-robotics" "guardian_ros_pkg" "${default_branch_name}"
clone_git_repository "https://github.com/inesc-tec-robotics" "robotnik_tilt_laser" "${default_branch_name}"
clone_git_repository "https://github.com/inesc-tec-robotics" "um7" "indigo-devel"


ls "${catkin_folder}/src/robotnik_tilt_laser/external/dxl_sdk_2.0_for_linux/build" &> /dev/null
if [ $? -ne 0 ]; then
	echo -e "\n\n"
	echo "===================================================================="
	echo "=== Building dxl sdk"
	cd robotnik_tilt_laser/external/dxl_sdk_2.0_for_linux/src
	make
	sudo make install
	cd ${catkin_folder}/src
fi


echo -e "\n\n"
echo "===================================================================="
echo "=== Cloning localization packages"
clone_git_repository "https://github.com/inesc-tec-robotics" "dynamic_robot_localization" "${default_branch_name}"
${catkin_folder}/src/dynamic_robot_localization/install/install.sh


echo -e "\n\n"
echo "===================================================================="
echo "=== Cloning navigation packages"
echo "---> TODO <---"


echo -e "\n\n"
echo "===================================================================="
echo "=== Installing packages dependencies"
echo -e "\n"

cd ${catkin_folder}
rosdep update
rosdep check --from-paths src --ignore-src --rosdistro=${ros_version}
rosdep install --from-paths src --ignore-src --rosdistro=${ros_version} -y

echo -e "\n\n"
echo "===================================================================="
echo "=== Remaining dependencies that must be manually checked"
rosdep check --from-paths src --ignore-src --rosdistro=${ros_version}


echo -e "\n\n"
echo "===================================================================="
echo "=== Building catkin workspace"
cd "${catkin_folder}"

find ./src -name "*.sh" -exec chmod +x {} \;
find ./src -name "*.cfg" -exec chmod +x {} \;

catkin_make


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
