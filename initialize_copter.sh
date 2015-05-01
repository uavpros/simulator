#!/bin/bash


cd ~/ardupilot/ArduCopter  #move to appropriate vehicle directory

make configure  #setup the build configuration

sim_vehicle.sh -w   # runs sim script with option to wipe the virtual eeprom, needs testing, not sure if can run without absolute path

