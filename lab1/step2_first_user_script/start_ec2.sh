#!/bin/bash



echo "Starting server instance..."

#INSTALL_SCRIPT=`dirname $0`/run_on_instance/installInstance_base.sh
ec2-run-instances ami-a798b3d3 -f ./run_on_instance/installInstance_base.sh -k ec2_valtech_keypair -g demo --region eu-west-1


    