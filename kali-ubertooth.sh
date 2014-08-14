#!/bin/bash
#
# https://github.com/greatscottgadgets/ubertooth/wiki/Build-Guide
# http://www.splitbits.com/2014/05/14/ubertooth-spectools-chromebook/
# http://penturalabs.wordpress.com/2013/09/01/ubertooth-open-source-bluetooth-sniffing/

apt-get install cmake libusb-1.0-0-dev make gcc g++ libbluetooth-dev pkg-config libpcap-dev python-numpy python-pyside python-qt4

# PyUSB 1.0 is not yet available from the Debian, Ubuntu or Homebrew repositories, 
#if you don't already have it installed you will need to fetch and build it as follows:

cd /tmp
wget https://github.com/walac/pyusb/archive/1.0.0b1.tar.gz -O pyusb-1.0.0b1.tar.gz
tar xvf pyusb-1.0.0b1.tar.gz
cd pyusb-1.0.0b1
sudo python setup.py install

cd /tmp
rm pyusb-1.0.0b1.tar.gz
rm -rf pyusb-1.0.0b1


wget https://github.com/greatscottgadgets/libbtbb/archive/2014-02-R2.tar.gz -O libbtbb-2014-02-R2.tar.gz
tar xf libbtbb-2014-02-R2.tar.gz
cd libbtbb-2014-02-R2
mkdir build
cd build
cmake ..
make
sudo make install


wget https://github.com/greatscottgadgets/ubertooth/archive/2014-02-R2.tar.gz -O ubertooth-2014-02-R2.tar.gz
tar xf ubertooth-2014-02-R2.tar.gz
cd ubertooth-2014-02-R2/host
mkdir build
cd build
cmake ..
make
sudo make install


sudo apt-get install libpcap0.8-dev libcap-dev pkg-config build-essential libnl-dev libncurses-dev libpcre3-dev libpcap-dev libcap-dev
wget https://kismetwireless.net/code/kismet-2013-03-R1b.tar.xz
tar xf kismet-2013-03-R1b.tar.xz
cd kismet-2013-03-R1b
ln -s ../ubertooth-2014-02-R2/host/kismet/plugin-ubertooth .
./configure
make && make plugins
sudo make suidinstall
sudo make plugins-install
Add "pcapbtbb" to the "logtypes=..." line in kismet.conf

sudo apt-get install wireshark wireshark-dev libwireshark3 libwireshark-dev cmake
cd libbtbb-2014-02-R2/wireshark/plugins/btbb
mkdir build
cd build
cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu/wireshark/libwireshark3/plugins ..
make
sudo make install
