------------------------

# Bundle running instance
-------------------------
TODO document how-to.....

Try out: an s3-based AMI (with configured hudson-server as setup in step3)

IMAGE	ami-d9765cad

ec2-run-instances ami-d9765cad -k ec2_valtech_keypair -g demo

#There is no deamon for running hudson on that server, so:
ssh into the instance
cd /opt/hudson/
java -jar hudson.war &

Goto (in browser): http://HOST_NAME:8080  
# Should be preconfigured with project "Hello World" as above



