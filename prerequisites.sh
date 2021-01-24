#!/usr/bin/env bash

# References
# https://stackoverflow.com/questions/12137431/test-if-a-command-outputs-an-empty-string
# https://linuxhint.com/apt_cache_search_packages/
# https://itsfoss.com/unable-to-locate-package-error-ubuntu/
# https://www.tecmint.com/assign-linux-command-output-to-variable/#:~:text=shell%20scripting%20purpose.-,To%20store%20the%20output%20of%20a%20command%20in%20a%20variable,command%20%5Boption%20...%5D
# https://linuxconfig.org/how-to-use-arrays-in-bash-script#h3-adding-elements-to-an-array
# https://linuxize.com/post/bash-if-else-statement/


# Define ANSI Color Code
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

# Installing Prerequisites
echo -e "Installing Prerequisites"

#sudo apt-get install libopencv-dev python-opencv
#sudo apt-get install libopenblas-dev
#sudo apt-get install libatlas-base-dev
#sudo apt-get install libboost-all-dev
#sudo apt-get install python-pip python-dev build-essential
#sudo pip install --upgrade pip
#pip install protobuf

# Declare a Prerequisites array
declare -a P_StringArray=("libopencv-dev" "python-opencv" "libopenblas-dev" "libatlas-base-dev" "libboost-all-dev" "python-pip" "python-dev" "build-essential")
declare -a P_pip_StringArray=("protobuf")

# Declare a Prerequisites (valid/non-valid) array
declare -a P_Valid_StringArray
declare -a P_InValid_StringArray
declare -a P_pip_Valid_StringArray
declare -a P_pip_InValid_StringArray

# Read the array values with space
for val in "${P_StringArray[@]}"; 
do
	if [[ $(sudo apt-cache search $val) ]]; 
	then
		if [[ $? -eq 0 ]]
		then
			sudo apt-get install $val
			P_Valid_StringArray+="$val,"
		fi
	else
		P_InValid_StringArray+="$val,"
	fi
done

# Read the array values with space
for val in "${P_pip_StringArray[@]}"; 
do
#	if [[ $(sudo apt-cache search $val) ]]; 
#	then
#		if [[ $? -eq 0 ]]
#		then
	python -m pip install $val
	P_pip_Valid_StringArray+="$val,"
#		fi
#	else
#		P_InValid_StringArray+="$val,"
#	fi
done

# Iterating comma separated string values
Field_Separator=$IFS 
# set comma as internal field separator for the string list
IFS=,

echo -e "${LIGHTCYAN}Prerequisites Checklist${NC}"
for val in $P_Valid_StringArray; do
	echo -e "[ ${GREEN}\xE2\x9C\x94${NC} ] sudo apt-get install $val"
done

for val in $P_InValid_StringArray; do
	echo -e "[ ${RED}\xE2\x9D\x8C${NC} ] sudo apt-get install $val"
done

for val in $P_pip_Valid_StringArray; do
	echo -e "[ ${GREEN}\xE2\x9C\x94${NC} ] python -m pip install $val"
done

IFS=$Field_Separator

## Declare a General Dependencies array
#declare -a GD_StringArray=("sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler" "sudo apt-get install the python-dev" "sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev" "sudo apt-get install abbbbc")

## Read the array values with space
#for val in "${GD_StringArray[@]}"; do
#	$val
#	wait
#	if [[ $? -eq 1 ]]
#	then
#		GD_Success_StringArray+="$val,"
#	else
#		GD_Failed_StringArray+="$val,"
#	fi
#done

## Declare a General Dependencies (success/failed) array
#declare -a GD_Success_StringArray
#declare -a GD_Failed_StringArray

## Iterating comma separated string values
#Field_Separator=$IFS 
## set comma as internal field separator for the string list
#IFS=,
#for val in $GD_Success_StringArray; do
#	echo -e "[ ${GREEN}\xE2\x9C\x94${NC} ] $val"
#done

#for val in $GD_Failed_StringArray; do
#	echo -e "[ ${RED}\xE2\x9D\x8C${NC} ] $val"
#done
#IFS=$Field_Separator

#while read -r line
#do
#	echo "$line"
#done < <(find "E: Unable to locate package" -type f)

#sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler

#sudo apt-get install the python-dev 

#sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
#sudo apt-get update &
#wait
#echo -e "Job 1 exited with status $?"
#echo "$?"
#if [[ $? -eq 0 ]]
#then
#	echo -e "Job 1 exited with status $?"
#else
#	echo -e "Hurm!"
#fi
