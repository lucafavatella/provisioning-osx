#!/bin/sh
docker run -it --rm -v /Users/$(whoami):/Users/$(whoami) -w $(pwd) -e CLASSPATH java:openjdk-7 java "$@"
## Add `-p 9300:9300` for exposing port.
