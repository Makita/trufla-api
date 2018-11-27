#!/bin/bash

# Exit on failure
set -e

# Delete the old repo
rm -rf /home/ec2-user/trufla-api

# Just in case
cd /home/ec2-user

# Clone the repo again
git clone https://gitlab.com/Makita1/trufla-api.git

# Kill the previous instance of the server
kill -9 `cat /home/ec2-user/api.pid`

# Start the server again
cd /home/ec2-user/trufla-api
nohup rails server puma -p 3000 > /dev/null 2>&1 & echo $! > /home/ec2-user/api.pid