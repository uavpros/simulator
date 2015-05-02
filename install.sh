#!/bin/bash

apt-get update && apt-get upgrade -y

# download a bunch of dependencies and fun stuff
apt-get install -y libtool automake autoconf libexpat1-dev python-matplotlib python-serial python-wxgtk2.8 python-lxml 
apt-get install -y python-scipy python-opencv ccache gawk git python-pip python-pexpect

pip install pymavlink MAVProxy  # installs MAVProxy via python package mgr

cd ~   #sitl should be run from home directory

git clone git://github.com/diydrones/ardupilot.git  #download official ardupilot code 
git clone git://github.com/tridge/jsbsim.git  #download realistic sim software for fixed wing / plane

export PATH=$PATH:$HOME/jsbsim/src
export PATH=$PATH:$HOME/ardupilot/Tools/autotest
export PATH=/usr/lib/ccache:$PATH

. ~/.bashrc





