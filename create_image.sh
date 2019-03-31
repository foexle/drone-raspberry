#!/bin/bash 
#
# @script          create_image.sh
# @description     This scirpt is the main entry point to create an image based on ARM 
#                  and improved for RaspberryPI
#


set -x
set -e

# Set to false to disable auto building
export PACKERFILE=${PACKERFILE:-example.json}

if [[ -f ${PACKERFILE} ]]; then {
  packer build ${PACKERFILE}
}; fi


