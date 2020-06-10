#/bin/sh

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


echo "" >> $shellConfigFile
echo "" >> $shellConfigFile

userBinFolder=~/bin
echo "export PATH=$userBinFolder:$PATH" >> $shellConfigFile