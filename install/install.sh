#!/usr/bin/env bash

set_cpu_governor_to_performance=${1:-"false"}
ros_version=${2:-"hydro"}
default_branch_name=${3:-"hydro-devel"}
user_name=${4:-"$USER"}
catkin_folder=${5:-"/home/${user_name}/catkin_ws"}

script_dir="$(dirname "$(readlink -e "${BASH_SOURCE[0]}")" && echo X)" && script_dir="${script_dir%$'\nX'}"


echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Setting up development apps and ROS"
echo "****************************************************************************************************"
${script_dir}/1_initial_setup/a1_apps.sh
${script_dir}/1_initial_setup/b1_insesc_account.sh
${script_dir}/1_initial_setup/b2_git_configs.sh

if [ "${set_cpu_governor_to_performance}" = true ]; then
	${script_dir}/1_initial_setup/b3_cpu_scaling_performance.sh
fi

${script_dir}/1_initial_setup/c1_ros.sh ${ros_version} ${user_name}
${script_dir}/1_initial_setup/c2_catkin_workspace.sh ${ros_version} ${catkin_folder} ${user_name}
${script_dir}/1_initial_setup/d1_clock_syncronization.sh
echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Finished setting up development apps and ROS"
echo "****************************************************************************************************"



echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Setting up guardian configuration files"
echo "****************************************************************************************************"
${script_dir}/2_configuration_files/setup_configuration_files.sh ${user_name} ${ros_version} ${catkin_folder}
echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Finished setting up guardian configuration files"
echo "****************************************************************************************************"



echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Setting up guardian software"
echo "****************************************************************************************************"
${script_dir}/3_guardian_setup/a1_guardian_dependencies.sh ${ros_version}
${script_dir}/3_guardian_setup/a2_guardian_sw.sh ${ros_version} ${default_branch_name} ${catkin_folder}
${script_dir}/3_guardian_setup/a3_joy_stick_pairing.sh ${ros_version}
echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Finished setting up guardian software"
echo "****************************************************************************************************"
