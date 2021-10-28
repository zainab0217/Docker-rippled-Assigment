#!/bin/bash
docker ps -a|grep dockerrippled:latest|cut -d " " -f 1 |xargs -I__ echo "echo 'Stopping container _' && docker stop __" | bash
docker ps -a|grep dockerrippled:latest|cut -d " " -f 1 |xargs -I__ echo "echo 'Removing container _' && docker rm __" | bash
