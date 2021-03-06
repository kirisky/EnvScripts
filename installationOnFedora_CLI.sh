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
scripts=$(ls $basePath | grep "\.sh")

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


############################# executing logic ##########################################################################
#
# Execute the scripts by the executor file
#
source ./common/executor
