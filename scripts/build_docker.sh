#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
HOST_IP=($(hostname -I))
img_name=$(dirname  $(readlink -m $DIR))
img_name=${img_name##*/}-img
docker build \
        --build-arg hostname=$(hostname) \
        --build-arg ros_master_uri="http://${HOST_IP[0]}:11311" \
        --build-arg host_ip=${HOST_IP[0]} \
        --tag $img_name \
        $DIR/../docker