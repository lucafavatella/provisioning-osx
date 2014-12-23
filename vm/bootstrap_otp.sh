#!/usr/bin/env sh

## Functions

bootstrap_root() {
    [ $(whoami) = "root" ] || exit 1

    OPTS_APT="-y --no-install-recommends"
    KERL_DEPS=curl
    OTP_DEPS=libncurses-dev

    apt-get update && apt-get install ${OPTS_APT} ${KERL_DEPS} ${OTP_DEPS}
}

bootstrap_vagrant() {
    [ $(whoami) = "vagrant" ] || exit 1

    KERL_DIR=dev/kerl
    KERL_INST_DIR=${KERL_DIR}/installations
    OTP_VSN=17.4
    OTP_INST_DIR=${KERL_INST_DIR}/${OTP_VSN}

    mkdir -p ${KERL_DIR}
    curl https://raw.githubusercontent.com/spawngrid/kerl/master/kerl -o ${KERL_DIR}/kerl
    chmod a+x ${KERL_DIR}/kerl

    ${KERL_DIR}/kerl update releases
    ${KERL_DIR}/kerl build ${OTP_VSN} ${OTP_VSN}

    mkdir -p ${OTP_INST_DIR}
    ${KERL_DIR}/kerl install ${OTP_VSN} ${OTP_INST_DIR}

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
