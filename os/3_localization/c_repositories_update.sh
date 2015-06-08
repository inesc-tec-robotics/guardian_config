#!/bin/sh

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

guardian_ws=${1:-"/home/guardian/catkin_ws/src/"}
cd ${guardian_ws}
if [ $? -ne 0 ]; then
	exit -1
fi

reset_ws=${2:-true}

repositories_dirs=${3:-"dynamic_robot_localization pose_to_tf_publisher laserscan_to_pointcloud robot_localization_tools octomap_mapping dynamic_robot_localization_tests mesh_to_pointcloud"}


echo "\n\n"
echo "####################################################################################################"
echo "##### Updating git repositories"
if [ "${reset_ws}" = true ] ; then
	echo "##### git reset --hard HEAD will be performed before pulling"
fi
echo "####################################################################################################\n"


for git_repository in ${repositories_dirs}
do
	cd ${git_repository}
	if [ $? -eq 0 ]; then
		echo "\n-------------------------------------------"
		echo "==> Updating ${git_repository}"
		if [ "${reset_ws}" = true ] ; then
			git reset --hard HEAD
		fi
		git pull
		cd ..
	fi
done



echo "\n\n"
echo "----------------------------------------------------------------------------------------------------"
echo ">>>>> Update finished"
echo "----------------------------------------------------------------------------------------------------"
