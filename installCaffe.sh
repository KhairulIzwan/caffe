#!/usr/bin/env bash

# Define bash shell variable
Home="$HOME"

# ANSI Color Code
NC='\033[0m' # No Color
BLACK='\033[0;30m'
DARKGRAY='\033[1;30m'
RED='\033[0;31m'
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'
LIGHTGREEN='\033[1;32m'
BROWN='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHTBLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHTPURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHTCYAN='\033[1;36m'
LIGHTGRAY='\033[0;37m'
WHITE='\033[1;37m'

echo "[INFO] general_dependencies..."
./general_dependencies.sh &
wait
echo "${GREEN}[DONE]${NC} general_dependencies..."
echo "[INFO] prerequisites..."
./prerequisites.sh &
wait
echo "${GREEN}[DONE]${NC} prerequisites..."
wait
echo "[INFO] make all..."
make all &
wait
echo "${GREEN}[DONE]${NC} make all..."
echo "[INFO] make test..."
make test &
wait
echo "${GREEN}[DONE]${NC} make test..."
echo "[INFO] make runtest..."
make runtest &
echo "${GREEN}[DONE]${NC} make runtest..."
echo "[INFO] make pycaffe..."
make runtest &
echo "${GREEN}[DONE]${NC} make pycaffe..."
echo "Installation Completed!"

echo export PYTHONPATH=/$Home/caffe/python:$PYTHONPATH >> ~/.bashrc
source ~/.bashrc

exit 0

###echo -e "[ \xE2\x9C\x94 ]"
###echo -e "[ \xE2\x9D\x8C ]"

###function check()
###{
###	echo "Sleep for $1 seconds"
###	sleep $1
###	exit $2
###}

###check $1 $2 &
####b=$!
####echo "$b"
###echo "Checking the status"
###wait && echo OK || echo NOT OK

##Installing General Dependencies
#echo -e "Installing General Dependencies"
##Declare a string array
#declare -a StringArray=("sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler" "sudo apt-get install the python-dev" "sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev")

## Read the array values with space
#for val in "${StringArray[@]}"; do
#	$val
#done

##sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler

##sudo apt-get install the python-dev 

##sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
##sudo apt-get update &
##wait
##echo -e "Job 1 exited with status $?"
##echo "$?"
##if [[ $? -eq 0 ]]
##then
##	echo -e "Job 1 exited with status $?"
##else
##	echo -e "Hurm!"
##fi
