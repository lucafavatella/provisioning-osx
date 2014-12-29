#!/usr/bin/env sh

# set -x ## DEBUG

## Configuration

OTP_VSN=17.4

## Functions

apt_install() {
    apt-get update && apt-get install -y --no-install-recommends $@
}

bootstrap_root() {
    [ $(whoami) = "root" ] || exit 1

    KERL_DEPS=curl
    OTP_DEPS=libncurses-dev libssl-dev

    apt_install ${KERL_DEPS} ${OTP_DEPS}
}

bootstrap_vagrant() {
    [ $(whoami) = "vagrant" ] || exit 1

    KERL_DIR=dev/kerl
    KERL_INST_DIR=${KERL_DIR}/installations
    OTP_INST_DIR=${KERL_INST_DIR}/${OTP_VSN}

    mkdir -p ${KERL_DIR}
    curl -s https://raw.githubusercontent.com/spawngrid/kerl/master/kerl -o ${KERL_DIR}/kerl
    chmod a+x ${KERL_DIR}/kerl

    ${KERL_DIR}/kerl update releases 1> /dev/null 2> /dev/null
    ${KERL_DIR}/kerl build ${OTP_VSN} ${OTP_VSN} 1> /dev/null 2> /dev/null || tail /home/vagrant/.kerl/builds/${OTP_VSN}/otp_build_${OTP_VSN}.log ## HACK

    mkdir -p ${OTP_INST_DIR}
    ${KERL_DIR}/kerl install ${OTP_VSN} ${OTP_INST_DIR} 1> /dev/null 2> /dev/null

    ## HINT: . ${OTP_INST_DIR}/activate
}

## Main

case $1 in
    "root")
        bootstrap_root
        ;;
    "vagrant")
        bootstrap_vagrant
        ;;
esac
