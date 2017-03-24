#!/bin/bash

# Start the container
docker run --name=i2pd-hostbase  -td -p 7071:7071 -p 9439:9439 cmotc/i2pd-hostbase
