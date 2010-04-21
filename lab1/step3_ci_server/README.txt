# A simple usage of an EC2-instance running as a CI-server (with hudson), building a sample project from github 
# regitering DNS: valtech.isa-geek.net:8080

# Run CI-instance
ec2-run-instances ami-a798b3d3 -f ./run_on_instance/install_ci_base.sh -k ec2_valtech_keypair -g demo

# it takes a while to configure everything...



#Example of configuring hudson 
#in browser: http://valtech.isa-geek.net:8080
manage hudson/git plugin - install

new job: Hello World

Use Git, Url: git://github.com/andreasekstrom/demo-helloworld.git

Build: Goals - test

POM: demo-app/pom.xml

Publish test reports:
demo-app/target/surefire-reports/*.xml

Save

Trigger build

# Should work now, but takes a while (first usage of maven etc)

------------------------

# Bundle running instance
-------------------------
TODO document how-to.....

Try out: an s3-based AMI (with configured hudson-server as above)

IMAGE	ami-d9765cad

ec2-run-instances ami-d9765cad -k ec2_valtech_keypair -g demo

#There is no deamon for running hudson on that server, so:
ssh into the instance
cd /opt/hudson/
java -jar hudson.war &

Goto (in browser): http://HOST_NAME:8080  
# Should be preconfigured with "Hello World" as above



