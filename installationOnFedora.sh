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


############################# loading requirements #######################################################################
#
# load shell colors
#
source ./common/16Color

############################# executing logic ##########################################################################
#
# Execute the scripts by the executor file
#
source ./common/executor
