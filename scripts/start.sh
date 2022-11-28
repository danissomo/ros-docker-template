#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
container_name=$(dirname  $(readlink -m $DIR))
container_name=${container_name##*/}
img_name=$container_name-img
if [ ! "$(docker ps -a | grep $container_name)" ]; then
    docker run  -di \
                --name $container_name \
                --add-host $(hostname):$(hostname -i) \
                --mount type=bind,src=$DIR/../..,dst=/root/catkin_ws/src \
                --hostname ros-0 \
                -P \
                $img_name bash
fi

if ! [ "$( docker container inspect -f '{{.State.Status}}' $container_name )" == "running" ]; then 
    docker start $container_name
fi

docker exec $container_name bash  -c "source /root/.bashrc; catkin_make"