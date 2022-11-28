source /opt/ros/$ROS_DISTRO/setup.bash
source $PROJECT_DIR/devel/setup.bash
export ROS_MASTER_URI=http://<master_ip>:<master_port>
export ROS_IP=$(hostname -i)
