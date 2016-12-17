#!/usr/bin/env bash

rosnode kill /static_transform_publisher_projector
sleep 10
echo -e "Starting projection\n"
rosrun tf static_transform_publisher 0.323 -0.132 0.667 -0.0162178098852535 0.1186819994467838 0.0000114862368421 base_link projector_link 1000 __name:=static_transform_publisher_projector &

sleep 30

echo -e "Stopping projection\n"
rosnode kill /static_transform_publisher_projector
sleep 2
rosrun tf static_transform_publisher 0.323 -0.132 0.667 -0.0162178098852535 1.5707 0.0000114862368421 base_link projector_link 1000 __name:=static_transform_publisher_projector &
sleep 7
