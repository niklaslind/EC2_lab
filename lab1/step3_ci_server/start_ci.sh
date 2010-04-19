#!/bin/bash

echo "Starting server instance..."

ec2-run-instances ami-a798b3d3 -f ./run_on_instance/install_ci_base.sh -k ec2_valtech_keypair -g demo
