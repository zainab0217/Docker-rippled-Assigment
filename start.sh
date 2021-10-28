#!/bin/bash

self(){
  DIR=$( cd "$( dirname "$0" )/" && pwd)
  echo $DIR
}

$(self)/down

PORT=80

CUSTOMPORT=$(echo $1|egrep "^[0-9]+$"|wc -l)

if [[ "$CUSTOMPORT" -gt "0" ]]; then
    PORT=$1
fi

docker run \
    -dit \
    --name ripple \
    -p $PORT:80 \
    -v $(self)/../config:/config/ \
    dockerrippled:latest

docker logs -f ripple
