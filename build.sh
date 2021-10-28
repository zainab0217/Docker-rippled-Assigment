#!/bin/bash

self(){
  DIR=$( cd "$( dirname "$0" )/" && pwd)
  echo $DIR
}

echo "Stopping containers"
docker ps -a|grep dockerrippled:latest|cut -d " " -f 1 |xargs -I__ docker stop __

if [[ $(docker images -a|grep xrpllabsofficial/xrpld:latest|wc -l) -gt "0" ]]; then
  echo "Removing image"
  docker rmi -f dockerrippled:latest
fi

echo "Building image"
docker build --tag dockerrippled:latest $(self)/../.

echo "Done, you can now run $(self)/up"
