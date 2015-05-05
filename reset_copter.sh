#!/bin/bash


cd ~/ardupilot/ArduCopter  #move to appropriate vehicle directory

make configure  #setup the build configuration

~/ardupilot/Tools/autotest/sim_vehicle.sh -w   # runs sim script with option to wipe the virtual eeprom

