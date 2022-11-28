#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
container_name=$(dirname  $(readlink -m $DIR))
container_name=${container_name##*/}
docker exec -it $container_name bash