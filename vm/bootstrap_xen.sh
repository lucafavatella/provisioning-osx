#!/usr/bin/env sh

# set -x ## DEBUG

## Functions

apt_install() {
    apt-get update && apt-get install -y --no-install-recommends $@
}

bootstrap_network() {
    [ $(whoami) = "root" ] || exit 1

    apt_install bridge-utils

    ## BTW The first network interface is special for Vagrant. Ref
    ## http://docs.vagrantup.com/v2/virtualbox/boxes.html

    IF=eth0
    BR=xenbr0

    ## Ref: http://wiki.xenproject.org/wiki?title=Network_Configuration_Examples_%28Xen_4.1%2B%29&oldid=13394#Example_Debian-style_bridge_configuration_.28e.g._Debian.2C_Ubuntu.29
    ##
    ## `xenbr0.cfg` is based upon the `eth0.cfg` file created by
    ## Vagrant. Not using cp/mv/sed in order to keep provisioning
    ## idempotent.

    cat > /etc/network/interfaces.d/${IF}.cfg <<EOF
auto ${IF}
iface ${IF} inet manual
EOF

    cat > /etc/network/interfaces.d/${BR}.cfg <<EOF
auto ${BR}
iface ${BR} inet dhcp
    bridge_ports ${IF}
EOF

    ## Refs:
    ## * https://github.com/mitchellh/vagrant/blob/v1.7.1/plugins/guests/debian/cap/configure_networks.rb#L46-47
    ## * https://github.com/mitchellh/vagrant/blob/v1.7.1/plugins/guests/debian/cap/configure_networks.rb#L55

    ifdown ${IF} && ip addr flush dev ${IF} && ifup ${BR} && ifup ${IF} || exit 1

    brctl show ## DEBUG
    ifconfig ## DEBUG
}

bootstrap_root() {
    [ $(whoami) = "root" ] || exit 1

    apt_install xen-system
}

bootstrap_vagrant() {
    [ $(whoami) = "vagrant" ] || exit 1

    ## Nothing..
}

## Main

case $1 in
    "network")
        bootstrap_network
        ;;
    "root")
        bootstrap_root
        ;;
    "vagrant")
        bootstrap_vagrant
        ;;
esac
