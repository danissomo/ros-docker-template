# /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"

container_name=$(dirname  $(readlink -m $DIR))
container_name=${container_name##*/}
if [ $1 = "--help" ] || [ $1 = "-h" ];
then
    echo "usage 
            no args: rosrun $container_name node.py
            1 arg  : rosrun $container_name <ARG> 
            2 arg  : rosrun <arg1> <arg2>
            "
fi


if [[ $1 == "" ]] && [[ $2 == "" ]]
then
    PKG=$container_name
    EXEC=node.py
    echo 1
elif [[ $2 == "" ]] && [[ $1 != "" ]]
then
    PKG=$container_name
    EXEC=$1
    echo 2

else
    PKG=$1
    EXEC=$2
    echo 3

fi
echo "launching pkg:$PKG exec:$EXEC" 

docker exec $container_name bash  -c "source /root/.bashrc; catkin_make; rosrun $PKG $EXEC"