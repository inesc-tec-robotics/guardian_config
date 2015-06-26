#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Installing system dependencies..."
echo "####################################################################################################"

ros_version=${1:-"$(rosversion -d)"}


echo "\n\n"
echo "===================================================================="
echo "=== Installing system dependencies"

sudo apt-get install coreutils -y
sudo apt-get install git -y
sudo apt-get install libopencv-dev -y
sudo apt-get install python-wstool -y
sudo apt-get install unclutter -y
sudo apt-get install wmctrl -y


echo "\n\n"
echo "===================================================================="
echo "=== Installing overall guardian_ros_pkg dependencies"

sudo apt-get install ros-${ros_version}-base-local-planner -y
sudo apt-get install ros-${ros_version}-controller-manager -y
sudo apt-get install ros-${ros_version}-fake-localization -y
sudo apt-get install ros-${ros_version}-gazebo-plugins -y
sudo apt-get install ros-${ros_version}-gazebo-ros -y
sudo apt-get install ros-${ros_version}-gazebo-ros-control -y
sudo apt-get install ros-${ros_version}-geometry-msgs -y
sudo apt-get install ros-${ros_version}-gmapping -y
sudo apt-get install ros-${ros_version}-hector-gazebo-plugins -y
sudo apt-get install ros-${ros_version}-hector-mapping -y
sudo apt-get install ros-${ros_version}-hector-trajectory-server -y
sudo apt-get install ros-${ros_version}-hokuyo-node -y
sudo apt-get install ros-${ros_version}-joy -y
sudo apt-get install ros-${ros_version}-joystick-drivers -y
sudo apt-get install ros-${ros_version}-map-server -y
sudo apt-get install ros-${ros_version}-move-base -y
sudo apt-get install ros-${ros_version}-openni-launch -y
sudo apt-get install ros-${ros_version}-openni2-launch -y
sudo apt-get install ros-${ros_version}-pr2-common -y
sudo apt-get install ros-${ros_version}-ps3joy -y
sudo apt-get install ros-${ros_version}-robot-localization -y
sudo apt-get install ros-${ros_version}-robot-state-publisher -y
sudo apt-get install ros-${ros_version}-ros-control -y
sudo apt-get install ros-${ros_version}-ros-controllers -y
sudo apt-get install ros-${ros_version}-rosbag -y
sudo apt-get install ros-${ros_version}-roslint -y
sudo apt-get install ros-${ros_version}-sensor-msgs -y
sudo apt-get install ros-${ros_version}-serial -y
sudo apt-get install ros-${ros_version}-std-msgs -y
sudo apt-get install ros-${ros_version}-tf -y
sudo apt-get install ros-${ros_version}-tf2 -y
sudo apt-get install ros-${ros_version}-tf2-ros -y
sudo apt-get install ros-${ros_version}-teleop-twist-joy -y
sudo apt-get install ros-${ros_version}-teleop-twist-keyboard -y
sudo apt-get install ros-${ros_version}-topic-tools -y
sudo apt-get install ros-${ros_version}-urg-node -y


echo "\n\n"
echo "===================================================================="
echo "=== Installing arm dependencies"

sudo apt-get install ros-${ros_version}-brics-actuator -y
sudo apt-get install ros-${ros_version}-cob-description -y
sudo apt-get install ros-${ros_version}-cob-srvs -y
sudo apt-get install ros-${ros_version}-libpcan -y
sudo apt-get install ros-${ros_version}-libntcan -y
sudo apt-get install ros-${ros_version}-moveit-commander -y
sudo apt-get install ros-${ros_version}-moveit-core -y
sudo apt-get install ros-${ros_version}-moveit-ikfast -y
sudo apt-get install ros-${ros_version}-moveit-planners-ompl -y
sudo apt-get install ros-${ros_version}-moveit-plugins -y
sudo apt-get install ros-${ros_version}-moveit-pr2 -y
sudo apt-get install ros-${ros_version}-moveit-ros-move-group -y
sudo apt-get install ros-${ros_version}-pr2-controllers -y


echo "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
