#!/bin/sh

echo "####################################################################################################"
echo "##### Cloning git repositories"
echo "####################################################################################################"

guardian_ws=${1:-'~/catkin_ws/src/'}
cd ${guardian_ws}

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

git clone git@github.com:carlosmccosta/dynamic_robot_localization.git 				# required
git clone git@github.com:carlosmccosta/pose_to_tf_publisher.git 					# required
git clone git@github.com:carlosmccosta/laserscan_to_pointcloud.git 					# required
git clone git@github.com:carlosmccosta/octomap_mapping.git 							# only needed for dynamic map update
git clone git@github.com:carlosmccosta/dynamic_robot_localization_tests.git 		# only needed to test the localization system
git clone git@github.com:carlosmccosta/robot_localization_tools.git 				# only needed to test the localization system
git clone git@github.com:inesc-tec-robotics/guardian-ros-pkg.git 					# only needed to test the localization system
git clone git@github.com:inesc-tec-robotics/crob_gazebo_models.git 					# only needed to test the localization system
git clone git@github.com:carlosmccosta/mesh_to_pointcloud.git 						# optional


echo "\n\n"
echo "----------------------------------------------------------------------------------------------------"
echo ">>>>> Cloning git repositories finished"
echo ">>>>> For updating each git repository use: git pull"
echo ">>>>> Or run ./c_repositories_update.sh"
echo "----------------------------------------------------------------------------------------------------"
