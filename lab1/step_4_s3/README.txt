
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

echo "XXXX
YYYY" > ~/.awssecret

#--------------------------------------------------------------------------------

# Run  S3-tools

BUCKET_NAME=<myname>.s3lab.valtech.se

./s3mkdir $BUCKET_NAME

./s3put $BUCKET_NAME/mystuff /tmp/minfil.txt

./s3ls $BUCKET_NAME

./s3get $BUCKET_NAME/mystuff

./s3delete $BUCKET_NAME/mystuff

./s3delete $BUCKET_NAME
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

