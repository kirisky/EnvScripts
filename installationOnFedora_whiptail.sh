#/bin/sh

############################# initializing global variables ############################################################
#
# Set a path for shell config file
#
shellConfigFile=~/.zshrc

#
# Fetch paths for change the directory
#
currentPath=`pwd`
basePath="./fedora"

# string for DOCKER_HOST
dockerHostString="export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock"

#
# Aquire scripts
#
scripts=($(ls $basePath | grep "\.sh"))

#
# Aquire current user's bin folder
#
userBinFolder=~/bin

#
# Path for zsh shell 
#
zshShellPath="/usr/bin/zsh"

#
# Path for oh-my-zsh
#
ohMyZshFolderPath=~/.oh-my-zsh


############################# loading requirements #######################################################################
#
# load shell colors
#
source ./common/16Color


############################# checking if zsh and oh-my-zsh has been installed on this machine #########################
source ./common/zsh_omz_installation
check_zsh_and_omz


############################# Launch Whiptail Dialog  #######################################################################
#
# Launch whiptail diglog and get selected options
#
# Reference
# https://saveriomiroddi.github.io/Shell-scripting-adventures-part-3/#check-list
#
title='Fedora Dev-Env Installation'
message='What apps do you want to install?'
scriptIndex=1
whiptailString=""
for element in ${scripts[@]}
do
    whiptailString+="$scriptIndex $element OFF "
    scriptIndex=$[$scriptIndex + 1]
done
selected_options=($(whiptail --separate-output --title "$title" --checklist "$message" 20 36 10 $whiptailString 3>&1 1>&2 2>&3))

tempArray=()
for i in ${!selected_options[@]}
do
    tempArray+=(${scripts[ ${selected_options[i]}-1 ]})
done

scripts=(${tempArray[@]})


############################# executing logic ##########################################################################
#
# Execute the scripts by the executor file
#
source ./common/executor
