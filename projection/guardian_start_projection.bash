#!/usr/bin/env bash

rosnode kill /static_transform_publisher_projector
rosrun tf static_transform_publisher 0.323 -0.132 0.667 -0.0162178098852535 0.1186819994467838 0.0000114862368421 base_link projector_link 1000 __name:=static_transform_publisher_projector &
