
### Intro ###
# --------------------------------------------------------------------------------

# getting started
# http://docs.amazonwebservices.com/AmazonS3/latest/gsg/


# Get secret key:
# https://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key


# --------------------------------------------------------------------------------




#--------------------------------------------------------------------------------
### S3 Tool ###
# info: http://timkay.com/aws/
# --------------------------------------------------------------------------------

# Test settings
find $S3_TOOL

#--------------------------------------------------------------------------------

# install S3-tools

cd $S3_TOOL
curl timkay.com/aws/aws -o aws
perl aws --install

# check that the key is installed from step 1
cat ~/.awssecret

#--------------------------------------------------------------------------------

# Run  S3-tools

BUCKET_NAME=<myname>.s3lab.valtech.se

s3mkdir $BUCKET_NAME

s3put $BUCKET_NAME/mystuff /tmp/minfil.txt

s3ls $BUCKET_NAME

s3get $BUCKET_NAME/mystuff

s3delete $BUCKET_NAME/mystuff

s3delete $BUCKET_NAME
#--------------------------------------------------------------------------------



#--------------------------------------------------------------------------------
### ACL and Browser access  ###
#--------------------------------------------------------------------------------

# use s3tools above to create a bucket with some items in it
./s3mkdir $BUCKET_NAME
./s3put $BUCKET_NAME/mystuff /tmp/minfil.txt


# Access bucket in browser:
http://$BUCKET_NAME.s3.amazonaws.com/mystuff
example: 
http://prep.s3lab.valtech.se.s3.amazonaws.com/mystuff # Response = access denied


curl --head $BUCKET_NAME.s3.amazonaws.com/minfil.txt #Response = forbidden


#set acl=public-read
./aws put "x-amz-acl: public-read" $BUCKET_NAME minfil.txt 


curl --head $BUCKET_NAME.s3.amazonaws.com/minfil.txt #OK!!

#Try Browser:
http://$BUCKET_NAME.s3.amazonaws.com
#--------------------------------------------------------------------------------


#--------------------------------------------------------------------------------
###  Other cool stuff ###
#--------------------------------------------------------------------------------

# Set cache header
./aws put "x-amz-acl: public-read" "Cache-Control: off" $BUCKET_NAME minfil.txt 

# View and edit ACL
./aws --xml get $BUCKET_NAME?acl > acl.xml
./aws put $BUCKET_NAME?acl  acl.xml
#--------------------------------------------------------------------------------


#--------------------------------------------------------------------------------
### s3curl ###
# Another alternative
#--------------------------------------------------------------------------------


#--------------------------------------------------------------------------------
### Firefox S3 Organizer ###
# info: https://addons.mozilla.org/en-US/firefox/addon/3247
#--------------------------------------------------------------------------------
# Open firefox
# open tools->addons
# find and install S3 Organizer 
# start tools->S3 organizer
# manage accounts: create new account "valtech" with keys from ~/.awssecret
# Have fun!
#--------------------------------------------------------------------------------




#================================================================================

# Simpe Storage Service (S3)

## Design requirements:

    * Scalable
    * Reliable: with 99.99% availability. 
    * Fast: Server-side latency must be insignificant relative to Internet latency.
    * Inexpensive: 
    * Simple:

## 

- skriv och läs obegränsat antal dataobjekt (1b -5Gb styck)
- unik nyckel per objekt, organiseras i "buckets"
- behöriget (public, private, rights for specific users) per dataobjekt
- HTTP enda protokoll idag. Bittorrent för stora filer, minska kostnader. API: REST-style+SOAP.
- S3 PUT & COPY sparar redundant på flera noder innan SUCCESS returneras
- checksummor används internt för att upptäcka och reparera skador
- allt versionshanteras. Du kan alltid hämta ut tidigare versioner
- Accessloggar per dataobjekt

## Buckets

Naming conventions

   1. Use 3 to 63 characters.
   2. Use only lower case letters (at least one), numbers, ‘.’ and ‘-’.
   3. Don’t start or end the bucket name with ‘.’ and don’t follow or precede a ‘.’ with a ‘-’.

Access <bucketname>.s3.amazonaws.com


