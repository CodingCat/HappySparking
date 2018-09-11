#!/bin/bash

set -x

sudo docker run --rm -m 4g -e JAVA_OPTS='-Xmx6g' --attach stdin --attach stdout --attach stderr --volume `pwd`:/KittenWhisker codingcat/xgbrelease:latest /KittenWhisker/dev/build.sh
