# Alpine SSHD

[![Image Layers](https://badge.imagelayers.io/ekapusta/alpine-sshd:latest.svg)](https://imagelayers.io/?images=ekapusta/alpine-sshd:latest) [![Docker Stars](https://img.shields.io/docker/stars/ekapusta/alpine-sshd.svg?style=flat-square)](https://hub.docker.com/r/ekapusta/alpine-sshd/) [![Docker Pulls](https://img.shields.io/docker/pulls/ekapusta/alpine-sshd.svg?style=flat-square)](https://hub.docker.com/r/ekapusta/alpine-sshd/)

## Build

    docker build --tag=ekapusta/alpine-sshd .

### Override through ENV

 * SSHD_OPTION_PERMIT_ROOT_LOGIN
 * SSHD_OPTION_USE_DNS
 * SSHD_COMMAND_AFTER

## Run restartable on 2222 port with mounted $HOME to root

    docker run --detach --restart=always --volume=$HOME:/root \
               --publish=2222:22 --name=sshd ekapusta/alpine-sshd

## Clean, run & go into

    docker ps --filter=name=sshd && docker stop sshd && docker rm sshd
    docker run --detach --name=sshd ekapusta/alpine-sshd
    docker exec --interactive=true --tty=true sshd sh

## Debug

    docker run --rm ekapusta/alpine-sshd
