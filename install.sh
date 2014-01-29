#!/bin/bash

for i in "sharkserver" "sharkclient"
do
sudo mkdir -p /var/log/supervisor/$i
sudo cp ./$i.conf /etc/supervisor/conf.d/
done

# ensure that the flag DOCKER_OPTS="-r=false is enabled in /etc/default/docker before using supervisord with docker.
## example:
# sudo sh -c "echo 'DOCKER_OPTS=$DOCKER_OPTS\"-r=false\"' >> /etc/default/docker"
