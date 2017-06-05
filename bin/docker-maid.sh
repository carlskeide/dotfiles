#!/bin/bash

[[ -z "$1" ]] &&\
    echo "usage: $0 <containers|images|volumes>" &&\
    exit 1

[[ "$1" == "all" || "$1" == "containers" ]] &&\
    echo "Containers" &&\
    docker ps -qf status=exited -f status=created | xargs -I{} docker rm -vf {}

[[ "$1" == "all" || "$1" == "images" ]] &&\
    echo "Images" &&\
    docker images -qf "dangling=true" | xargs -I{} docker rmi {}

[[ "$1" == "all" || "$1" == "volumes" ]] &&\
    echo "Volumes" &&\
    docker volume ls -qf 'dangling=true' | xargs -I{} docker volume rm  {}
