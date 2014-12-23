#!/usr/bin/env sh

OPTS_APT="-y --no-install-recommends"
KERL_DIR=dev/kerl
KERL_INST_DIR=${KERL_DIR}/installations
OTP_VSN=17.4
OTP_INST_DIR=${KERL_INST_DIR}/${OTP_VSN}

mkdir -p ${KERL_DIR}

apt-get update && apt-get install ${OPTS_APT} curl
curl https://raw.githubusercontent.com/spawngrid/kerl/master/kerl -o ${KERL_DIR}/kerl
chmod a+x ${KERL_DIR}/kerl

apt-get update && apt-get install ${OPTS_APT} libncurses-dev
${KERL_DIR}/kerl update releases
${KERL_DIR}/kerl build ${OTP_VSN} ${OTP_VSN}

mkdir -p ${OTP_INST_DIR}
${KERL_DIR}/kerl install ${OTP_VSN} ${OTP_INST_DIR}

#. ${OTP_INST_DIR}/activate
