


#------- Update this, lab-settings  -------
export EC2_LAB_HOME=<path-to-lab>/EC2_lab



#------- EC2-settings -------
export EC2_HOME=~/.ec2-tmp/ec2-api-tools-1.3-46266/
export PATH=$EC2_HOME/bin:$PATH
export EC2_PRIVATE_KEY=$EC2_LAB_HOME/keys/pk-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem
export EC2_CERT=$EC2_LAB_HOME/keys/cert-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem



#------- S3-settings -------
export S3_TOOL=$EC2_LAB_HOME/lab1/step_4_s3/s3tools
export PATH=$S3_TOOL:$PATH