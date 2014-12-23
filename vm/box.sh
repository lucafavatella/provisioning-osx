#!/usr/bin/env sh

set +x

vagrant -v
vagrant up
vagrant package
