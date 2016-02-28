## Build

    docker build --tag=ekapusta/alpine-sshd .

## Go into

    docker ps --filter=name=sshd && docker stop sshd && docker rm sshd
    docker run --detach --name=sshd ekapusta/alpine-sshd
    docker exec --interactive=true --tty=true sshd sh

## Debug

    docker run --rm ekapusta/alpine-sshd
