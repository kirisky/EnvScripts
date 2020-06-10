#/bin/sh

curl -fsSL https://get.docker.com/rootless | sh

echo "" >> $shellConfigFile
echo "" >> $shellConfigFile
echo $'export DOCKER_HOST=unix:///run/user/1001/docker.sock' >> $shellConfigFile
