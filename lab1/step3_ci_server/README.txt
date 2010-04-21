# A simple usage of an EC2-instance running as a CI-server (with hudson), building a sample project from github 
# regitering DNS: valtech.isa-geek.net:8080

# Run CI-instance
./start_ci.sh

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

