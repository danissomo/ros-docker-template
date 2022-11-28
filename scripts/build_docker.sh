#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
docker build \
        --build-arg hostname=$(hostname) \
        --build-arg ros_master_uri="http://$(hostname -i):11311" \
        --build-arg host_ip=$(hostname -i) \
        --tag my_docker \
        $DIR/../docker