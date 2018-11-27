#!/bin/bash

# Exit on failure
set -e

# Add the private key for the AWS EC2 instance into the keychain
eval $(ssh-agent -s)
echo "$PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null

# Prevent the "authenticity" message from SSHing because scripts can't deal with it
./deploy/disableHostKeyChecking.sh

PROD_SERVER=$PROD_SERVER

# Once inside the server, run updateAndRestart.sh
echo "Deploying to ${PROD_SERVER}"
ssh ec2-user@${PROD_SERVER} 'bash' < ./deploy/updateAndRestart.sh
