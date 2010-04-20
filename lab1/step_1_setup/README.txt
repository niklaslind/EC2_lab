


#--------------------------------------------------------------------------------
# Get lab source from github
#EC2_LAB_HOME=path to where you will check out the lab

cd $EC2_LAB_HOME
git clone git@github.com:niklaslind/EC2_lab.git

#--------------------------------------------------------------------------------

# edit and read lab-env-settings

vi $EC2_LAB_HOME/lab1/step_1_setup/setenv.sh  #EC2_LAB_HOME=path to where you will check out the lab

source $EC2_LAB_HOME/lab1/step_1_setup/setenv.sh

#--------------------------------------------------------------------------------

# Test your settings so far:

find $EC2_LAB_HOME/lab1/step_1_setup/setenv.sh
echo $EC2_HOME

#--------------------------------------------------------------------------------
# Download EC2-toolkit from amazon to /tmp
# Browser:
# http://developer.amazonwebservices.com/connect/entry.jspa?externalID=351

wget "http://www.amazon.com/gp/redirect.html/ref=aws_rc_ec2tools?location=http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip&token=A80325AA4DAB186C80828ED5138633E3F49160D9" -O /tmp/ec2-api-tools.zip


#--------------------------------------------------------------------------------

#Extract tools to $EC2_HOME/..

mkdir $EC2_HOME/..
unzip /tmp/ec2-api-tools.zip -d $EC2_HOME/..

#--------------------------------------------------------------------------------

# download AWS-keys:

pk-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem
cert-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem

to $EC2_LAB_HOME/keys

#--------------------------------------------------------------------------------

# generate ssh-key-pair

cd $EC2_LAB_HOME/keys
ec2-add-keypair <your_name>_keypair > id_rsa_<your_name>_keypair --region eu-west-1 
chmod 600 id_rsa_<your_name>_keypair 

#--------------------------------------------------------------------------------

# Test your installation:

find $EC2_LAB_HOME/lab1/step_1_setup/setenv.sh
find $EC2_HOME/bin/ec2-describe-instances
which ec2-describe-instances

find $EC2_PRIVATE_KEY
find $EC2_CERT

ls -l  $EC2_LAB_HOME/keys/id_rsa_<your_name>_keypair 
-rw-------  1 nli  nli  1758 Jan 21 22:34 /Users/nli/.ec2/id_rsa_ec2_niklas_keypair

#--------------------------------------------------------------------------------
