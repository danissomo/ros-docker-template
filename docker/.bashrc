source /opt/ros/$ROS_DISTRO/setup.bash
source $PROJECT_DIR/devel/setup.bash
export ROS_IP=$(hostname -i)
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[0;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "