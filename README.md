Robotnik Guardian - ROS and Gazebo packages

===============

### This tutorial covers the installation of the guardian-ros-pkg (https://github.com/inesc-tec-robotics/guardian-ros-pkg) and its dependencies

### 1. SETUP: 

# Please install (if not already installed) 
     * ROS Hydro: 
     	http://wiki.ros.org/hydro/Installation/Ubuntu
     * Gazebo 1.9: 
     	http://gazebosim.org/tutorials?tut=install&ver=1.9
## test gazebo:
     gzserver
# wait until you see a msg: "Msg Publicized address: nnn.nnn.nnn.nnn"
# and in another terminal run:
     gzclient


### the tutorial assumes you have your workspace named "catkin_ws"
# If not, create the workspace:
     Follow these instructions:  http://wiki.ros.org/catkin/Tutorials/create_a_workspace

# Download the guardian-ros-pkg into the src folder:
    cd ~/catkin_ws/src/
    git clone https://github.com/inesc-tec-robotics/guardian-ros-pkg


# Before compiling it install these dependencies:
     * sudo apt-get install ros-hydro-pr2-common ros-hydro-joy ros-hydro-joystick-drivers ros-hydro-ros-control ros-hydro-ros-controllers ros-hydro-controller-manager ros-hydro-gazebo-ros-control ros-hydro-gazebo-plugins ros-hydro-hector-gazebo-plugins

# compile the package
    cd ~/catkin_ws/     
    catkin_make


-------------------------------------------------------------------------------------------------------------------

### 2. RUNNING THE SIMULATION:


## Guardian in empty world:
roslaunch guardian_gazebo guardian.launch

## Guardian inside ship:
roslaunch guardian_gazebo guardian_ship_interior.launch

### when launching these, it is also launched the joystick and keyboard nodes to control the robot
## To use the keyboard you have to be in the window from which you lanched the simulation

* keyboard: wasd/WASD keys

## To use a joystick you need a configuration file
* joystick: config files @ guardian_joystick/launch/

          if needed create yout own and alter the line 
            <rosparam command="load" file="$(find guardian_joystick)/launch/logitech.yaml" />
          to
            <rosparam command="load" file="$(find guardian_joystick)/launch/MyOwnConfig.yaml" />