FROM ubuntu:20.04

ARG hostname
ARG host_ip
ARG ros_master_uri
RUN apt update

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt install -y curl gnupg gnupg2 gnupg1
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update && apt install -y ros-noetic-ros-base
ENV ROS_DISTRO noetic
RUN apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

ENV PROJECT_DIR=/root/catkin_ws
ENV ROS_MASTER_URI=${ros_master_uri}
WORKDIR /root/catkin_ws
COPY .bashrc /root/