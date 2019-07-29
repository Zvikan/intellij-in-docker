#!/bin/bash
# set -x #enable for debug if needed
NIC=en0

# Grab the ip address of this box
IPADDR=$(ifconfig $NIC | grep "inet " | awk '{print $2}')
DISP_NUM=$(jot -r 1 100 200)  # random display number between 100 and 200

PORT_NUM=$((6000 + DISP_NUM)) # so multiple instances of the container won't interfer with eachother
socat TCP-LISTEN:${PORT_NUM},reuseaddr,fork UNIX-CLIENT:\""$DISPLAY"\" 2>&1 > /dev/null &

docker run      \
                --env HOME="${HOME}" \
                --env DISPLAY="$IPADDR":"$DISP_NUM" \
                --interactive \
                --name intellij-in-docker \
                --rm \
                --tty \
                --volume "$HOME":"${HOME}" \
                --volume /tmp/.X11-unix:/tmp/.X11-unix \
                --volume /var/run/docker.sock:/var/run/docker.sock \
                --workdir "${HOME}" \
                zvikan/intellij-in-docker 
kill %1 # kills socat job 