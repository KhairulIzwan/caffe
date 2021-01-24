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

# Installing General Dependencies
echo -e "Installing General Dependencies"

# Declare a General Dependencies array
declare -a GD_StringArray=("libprotobuf-dev" "libleveldb-dev" "libsnappy-dev" "libopencv-dev" "libhdf5-serial-dev" "protobuf-compiler" "the python-dev" "libgflags-dev" "libgoogle-glog-dev" "liblmdb-dev")

# Declare a General Dependencies (valid/non-valid) array
declare -a GD_Valid_StringArray
declare -a GD_InValid_StringArray

# Read the array values with space
for val in "${GD_StringArray[@]}"; 
do
	if [[ $(sudo apt-cache search $val) ]]; 
	then
		if [[ $? -eq 0 ]]
		then
			sudo apt-get install $val
			GD_Valid_StringArray+="$val,"
		fi
	else
		GD_InValid_StringArray+="$val,"
	fi
done

# Iterating comma separated string values
Field_Separator=$IFS 
# set comma as internal field separator for the string list
IFS=,

echo -e "${LIGHTCYAN}General Dependencies Checklist${NC}"
for val in $GD_Valid_StringArray; do
	echo -e "[ ${GREEN}\xE2\x9C\x94${NC} ] sudo apt-get install $val"
done

for val in $GD_InValid_StringArray; do
	echo -e "[ ${RED}\xE2\x9D\x8C${NC} ] sudo apt-get install $val"
done
IFS=$Field_Separator
