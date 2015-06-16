#!/usr/bin/env bash

set_cpu_governor_to_performance=${1:-"false"}
install_logic_ml300_nuc_drivers=${2:-"true"}
ros_version=${3:-"hydro"}
default_branch_name=${4:-"hydro-devel"}
user_name=${5:-"$USER"}
catkin_folder=${6:-"/home/${user_name}/catkin_ws"}


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

${script_dir}/1_initial_setup/c1_ros.bash ${ros_version} ${user_name}
${script_dir}/1_initial_setup/c2_catkin_workspace.bash ${ros_version} ${catkin_folder} ${user_name}
echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Finished setting up development apps and ROS"
echo "****************************************************************************************************"



echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Setting up guardian configuration files"
echo "****************************************************************************************************"
${script_dir}/2_configuration_files/setup_configuration_files.bash ${user_name} ${ros_version} ${catkin_folder}
echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Finished setting up guardian configuration files"
echo "****************************************************************************************************"



echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Setting up guardian software"
echo "****************************************************************************************************"
${script_dir}/3_guardian_setup/a1_guardian_dependencies.sh ${ros_version}
${script_dir}/3_guardian_setup/a2_guardian_sw.bash ${ros_version} ${default_branch_name} ${catkin_folder}
${script_dir}/3_guardian_setup/a3_nfs_server.sh
${script_dir}/3_guardian_setup/a4_remote_desktop.sh
${script_dir}/3_guardian_setup/a5_clock_syncronization.sh

if [ "${install_logic_ml300_nuc_drivers}" = true ]; then
	${script_dir}/3_guardian_setup/a6_logic_ml300_nuc_drivers.sh
fi

${script_dir}/3_guardian_setup/a7_joy_stick_pairing.bash ${ros_version}
echo -e "\n\n"
echo "****************************************************************************************************"
echo "***** Finished setting up guardian software"
echo "****************************************************************************************************"
