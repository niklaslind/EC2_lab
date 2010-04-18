

1) Download and install EC2-toolkit from http://developer.amazonwebservices.com/connect/entry.jspa?externalID=351

unpack in folder ~/.ec2

ls ~/.e2c/ec2-api-tools-1.3-46266/
-rw-r--r--@   1 nli  wheel  75616 Dec 13 22:25 THIRDPARTYLICENSE.TXT
drwxrwxr-x@ 352 nli  wheel  11968 Dec 13 22:25 bin
drwxrwxr-x@  26 nli  wheel    884 Dec 13 22:25 lib
-rw-r--r--@   1 nli  wheel   5111 Dec 13 22:25 license.txt
-rw-r--r--@   1 nli  wheel   1813 Dec 13 22:25 notice.txt



2) edit EC2_lab/lab1/step_1_setup/setenv.sh
EC2_LAB_HOME=path to where you've checked out the lab



3) download keys:

pk-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem
cert-B2NCLKAPSNPIIQC2ADSPWXWVB33G73LJ.pem

to $EC2_LAB_HOME/keys


4) source $EC2_LAB_HOME/step_1_setup/setenv.sh


5) generate ssh-key-pair

cd $EC2_LAB_HOME/keys
ec2-add-keypair <your_name>_keypair > id_rsa_<your_name>_keypair --region eu-west-1 
chmod 600 id_rsa_<your_name>_keypair 


