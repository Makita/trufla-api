#!/bin/bash

# Exit on failure
set -e

# Delete the old repo
rm -rf /home/ec2-user/trufla-api

# Fetch the latest copy of the project
cd /home/ec2-user/trufla-api
git pull origin master