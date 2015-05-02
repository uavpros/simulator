#!/bin/bash

simframe=""
frameshort=""
subframe="" #not used, but could be for X + configuration
framepath=""
installpath="/ardupilot" #relative from $HOME
#GCS1="192.168.1.12" #not using yet, sim already outs to localhost
numcores=4   #need to add an autodetect method or user prompt to ensure core count is correct


chooseframe()
{
clear # declutter
echo 'Welcome to APM Simulator. Please select an aircraft:'
options=("Quadcopter" "Octocopter" "Plane" "Quit")
select opt in "${options[@]}"
do
  case $opt in
    "Quadcopter")
      echo "you chose Quadcopter"
      simframe="Quadcopter"
      frameshort="Quad"
      framepath="/ArduCopter/"
      startsim
      ;;
    "Octocopter")
      echo "you chose Octocopter"
      simframe="Octocopter"
      frameshort="Octo"
      framepath="/ArduCopter/"
      startsim
      ;;
    "Plane")
      echo "you chose Plane"
      simframe="Plane"
      frameshort="Plane"
      framepath="/ArduPlane/"
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

#debug
#cd $installpath$framepath
#echo $installpath$framepath

cd $HOME$installpath$framepath  #change to vehicle directory
~/ardupilot/Tools/autotest/sim_vehicle.sh -v Test$frameshort -j $numcores #--out $GCS1  #could still use -f X and -N options

}

chooseframe
