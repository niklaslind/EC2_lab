

# Installation intructions for Valtech EC2 labs


#--------------------------------------------------------------------------------
# Get lab source from github

git clone git@github.com:niklaslind/EC2_lab.git



#--------------------------------------------------------------------------------

# edit and read lab-env-settings

vi EC2_lab/lab1/step_1_setup/setenv.sh  #EC2_LAB_HOME=<path to where you checked out the lab>/EC2_lab

source EC2_lab/lab1/step_1_setup/setenv.sh

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

mkdir -p $EC2_HOME
unzip /tmp/ec2-api-tools.zip -d $EC2_HOME/..

#--------------------------------------------------------------------------------

# download and extract AWS-keys:

# Download EC2_labkeys.tar 
# from https://intranet.valtech.se/groups/valtech/events/labb-ec2-amazon-elastic-compute-cloud/
# to /tmp

cd /tmp
tar -xf EC2_labkeys.tar 
cp labkeys/pk-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem $EC2_LAB_HOME/keys
cp labkeys/cert-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem $EC2_LAB_HOME/keys
cp labkeys/.awssecret ~


cd $EC2_LAB_HOME/keys
wget host/labkeys.tar
tar -xf labkeys.tar

ls $EC2_LAB_HOME/keys
cert-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem
pk-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem

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

