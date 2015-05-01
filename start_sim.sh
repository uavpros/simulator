#!/bin/bash

simframe=""
frameshort=""
subframe="" #not used, but could be for X + configuration
framepath=""
installpath="~/ardupilot"
#GCS1="192.168.1.12" #not using yet, sim already outs to localhost
numcores=4   #need to add an autodetect method or user prompt to ensure core count is correct


chooseframe()
{
SS1='Welcome to APM Simulator. Please select an aircraft:'
options=("Quadcopter" "Octocopter" "Plane" "Quit")
select opt in "${options[@]}"
do
  case $opt in
    "Quadcopter")
      echo "you chose Quadcopter"
      simframe="Quadcopter"
      frameshort="Quad"
      framepath="$installpath/ArduCopter/"
      startsim
      ;;
    "Octocopter")
      echo "you chose Octocopter"
      simframe="Octocopter"
      frameshort="Octo"
      framepath="$installpath/ArduCopter/"
      startsim
      ;;
    "Plane")
      echo "you chose Plane"
      simframe="Plane"
      frameshort="Plane"
      framepath="$installpath/ArduPlane/"
      startsim
      ;;
    "Quit")
      break
      ;;
    *) echo invalid option;;
  esac
done
}


startsim()
{

cd $framepath  #change to vehicle directory

sim_vehicle.sh -v Test$frameshort -j $numcores #--out $GCS1  #could still use -f X and -N options

}
