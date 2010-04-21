

#--------------------------------------------------------------------------------

# Using the toolset
#--------------------------------------------------------------------------------

# Many images to choose from...
ec2-describe-images -a --region eu-west-1 | wc -l  -> 2261 ( can be more... )
ec2-describe-images -a --region us-east-1 --> 5804

# You can run any choice of OS, but for this lab to work you should use debian based Linux (e.g. Ubuntu 9.04)

ec2-describe-images -a --region eu-west-1 | grep ubuntu-9.04


# Run your first EC2-instance

ec2-add-group ec2lab -d "Valtech lab group"   (or use default)

ec2-run-instances ami-a798b3d3 -k <your_name>_keypair -g ec2lab --region eu-west-1    
# (-n NO_OF_INSTANCES)

# Want to run instance in europe? Irritating to have to add --region to every command
export EC2_URL=http://ec2.eu-west-1.amazonaws.com  (add to env-script)

# Firewall 
ec2-authorize ec2lab -p 22 
ec2-authorize ec2lab -p 80
ec2-authorize ec2lab -p 8080

# Don't want to use command-tools?
# Firefox plugin: Elastic fox: firefox-plugin
# https://addons.mozilla.org/en-US/firefox/addon/11626 
# You need your "Access Key ID" and "Secret Access Key"




# Add a startscript when starting an instance

#See start_ec2.sh and dir run_on_instance for example

# Simple example, start a new apache-webserver
./start_ec2.sh 

#when instance has started, got (in browser):
http://EC2_HOST_NAME

# Should return standard apache-install showing "it works" 


