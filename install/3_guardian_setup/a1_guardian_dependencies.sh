#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Installing system dependencies..."
echo "####################################################################################################"

ros_version=${1:-"$(rosversion -d)"}
install_args=${2:-"-y --allow-unauthenticated"}

echo "\n\n"
echo "===================================================================="
echo "=== Installing system dependencies"

sudo apt-get install coreutils ${install_args}
sudo apt-get install git ${install_args}
sudo apt-get install libopencv-dev ${install_args}
sudo apt-get install python-wstool ${install_args}
sudo apt-get install unclutter ${install_args}
sudo apt-get install wmctrl ${install_args}


echo "\n\n"
echo "===================================================================="
echo "=== Installing overall guardian_ros_pkg dependencies"

sudo apt-get install ros-${ros_version}-base-local-planner ${install_args}
sudo apt-get install ros-${ros_version}-control-toolbox ${install_args}
sudo apt-get install ros-${ros_version}-controller-manager ${install_args}
sudo apt-get install ros-${ros_version}-fake-localization ${install_args}
sudo apt-get install ros-${ros_version}-gazebo-plugins ${install_args}
sudo apt-get install ros-${ros_version}-gazebo-ros ${install_args}
sudo apt-get install ros-${ros_version}-gazebo-ros-control ${install_args}
sudo apt-get install ros-${ros_version}-geometry-msgs ${install_args}
sudo apt-get install ros-${ros_version}-gmapping ${install_args}
sudo apt-get install ros-${ros_version}-hector-gazebo-plugins ${install_args}
sudo apt-get install ros-${ros_version}-hector-mapping ${install_args}
sudo apt-get install ros-${ros_version}-hector-trajectory-server ${install_args}
sudo apt-get install ros-${ros_version}-hokuyo-node ${install_args}
sudo apt-get install ros-${ros_version}-joy ${install_args}
sudo apt-get install ros-${ros_version}-joystick-drivers ${install_args}
sudo apt-get install ros-${ros_version}-libpcan ${install_args}
sudo apt-get install ros-${ros_version}-map-server ${install_args}
sudo apt-get install ros-${ros_version}-move-base ${install_args}
sudo apt-get install ros-${ros_version}-openni-launch ${install_args}
sudo apt-get install ros-${ros_version}-openni2-launch ${install_args}
sudo apt-get install ros-${ros_version}-pr2-common ${install_args}
sudo apt-get install ros-${ros_version}-ps3joy ${install_args}
sudo apt-get install ros-${ros_version}-realtime-tools ${install_args}
sudo apt-get install ros-${ros_version}-robot-localization ${install_args}
sudo apt-get install ros-${ros_version}-robot-state-publisher ${install_args}
sudo apt-get install ros-${ros_version}-ros-control ${install_args}
sudo apt-get install ros-${ros_version}-ros-controllers ${install_args}
sudo apt-get install ros-${ros_version}-rosbag ${install_args}
sudo apt-get install ros-${ros_version}-roslint ${install_args}
sudo apt-get install ros-${ros_version}-sensor-msgs ${install_args}
sudo apt-get install ros-${ros_version}-serial ${install_args}
sudo apt-get install ros-${ros_version}-std-msgs ${install_args}
sudo apt-get install ros-${ros_version}-tf ${install_args}
sudo apt-get install ros-${ros_version}-tf2 ${install_args}
sudo apt-get install ros-${ros_version}-tf2-ros ${install_args}
sudo apt-get install ros-${ros_version}-teleop-twist-joy ${install_args}
sudo apt-get install ros-${ros_version}-teleop-twist-keyboard ${install_args}
sudo apt-get install ros-${ros_version}-topic-tools ${install_args}
sudo apt-get install ros-${ros_version}-urg-node ${install_args}


echo "\n\n"
echo "===================================================================="
echo "=== Installing arm dependencies"

sudo apt-get install ros-${ros_version}-brics-actuator ${install_args}
sudo apt-get install ros-${ros_version}-cob-description ${install_args}
sudo apt-get install ros-${ros_version}-cob-srvs ${install_args}
sudo apt-get install ros-${ros_version}-libpcan ${install_args}
sudo apt-get install ros-${ros_version}-libntcan ${install_args}
sudo apt-get install ros-${ros_version}-moveit-commander ${install_args}
sudo apt-get install ros-${ros_version}-moveit-core ${install_args}
sudo apt-get install ros-${ros_version}-moveit-ikfast ${install_args}
sudo apt-get install ros-${ros_version}-moveit-planners-ompl ${install_args}
sudo apt-get install ros-${ros_version}-moveit-plugins ${install_args}
sudo apt-get install ros-${ros_version}-moveit-pr2 ${install_args}
sudo apt-get install ros-${ros_version}-moveit-ros-move-group ${install_args}
sudo apt-get install ros-${ros_version}-pr2-controllers ${install_args}
sudo apt-get install ros-${ros_version}-pr2-mechanism-msgs ${install_args}
sudo apt-get install ros-${ros_version}-urdfdom-py ${install_args}


echo "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
