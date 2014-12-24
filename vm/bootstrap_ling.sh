#!/usr/bin/env sh

# set -x ## DEBUG

## Functions

bootstrap_vagrant() {
    [ $(whoami) = "vagrant" ] || exit 1

    mkdir -p dev/ling
    cd dev/ling

    curl -s -L https://github.com/cloudozer/ling/releases/download/v0.3.1/ling-0.3.1.tar.gz -O
    tar zxvf ling-0.3.1.tar.gz

    # mkdir sandbox
    # cp -a ling-0.3.1/railing sandbox/
    # cd sandbox
    # ./railing image ## Needs escript.
    # cat domain_config
}

## Main

case $1 in
    "vagrant")
        bootstrap_vagrant
        ;;
esac
