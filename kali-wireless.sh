#!/bin/bash
# http://www.janoweb.net/tutorials/install-drivers-rtl8187-r8187-rt2800usb-on-ubuntu-lucid-maverick.html#axzz39x5Kw0rH

. helper.sh

# apt-get install wireless-tools


#TODO: test it!
 sudo apt-get install linux-headers-$(uname -r) build-essential make patch subversion openssl libssl-dev zlib1g zlib1g-dev libssh2-1-dev libnl1 libnl-dev gettext autoconf tcl8.5 libpcap0.8 libpcap0.8-dev python-scapy python-dev cracklib-runtime macchanger-gtk tshark ethtool iw


# TODO: add horst
# git clone git://br1.einfach.org/horst

# GNU Radio 802.11
# An IEEE 802.11 a/g/p Transceiver  http://www.ccs-labs.org/projects/wime/
# git clone https://github.com/bastibl/gr-ieee802-11
