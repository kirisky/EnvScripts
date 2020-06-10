############################################## Functions  ###############################################################################################
#
# If the string of "export DOCKER_HOST" doesn not exist in home config file,
# then add it into the config file 
#
add_docker_host_string()
{
    if grep -Fxq "$dockerHostString" $shellConfigFile
    then
        echo "DOCKER_HOST variable has been exported!"
    else
        echo "" >> $shellConfigFile
        echo "" >> $shellConfigFile
        echo "$dockerHostString" >> $shellConfigFile
    fi
}

#
# If ~/bin does not exist in PATH variable in current env,
# then add it into the PATH env variable
#
add_user_bin_to_path()
{
    if [[ $PATH != *"$userBinFolder"* ]]; then
    
        echo "The bin folder in user home does not exist in PATH env variable. Now add it into user home config file."
    
        echo "" >> $shellConfigFile
        echo "" >> $shellConfigFile
        echo "export PATH=$userBinFolder:$PATH" >> $shellConfigFile
    
        echo "Added bin folder in user home into PATH env variable."
    fi
}

############################################## Main Logic ###############################################################################################

sudo dnf -y remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo cp ./config/docker-ce.repo /etc/yum.repos.d/

sudo dnf -y install docker-ce docker-ce-cli containerd.io

sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"

add_user_bin_to_path
add_docker_host_string
