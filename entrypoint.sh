#!/bin/bash

# Create pem
mkdir -p ~/.ssh
echo ${SSH_KEY} > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# install curl
apt-get update && apt install curl -y

# install meteor
curl https://install.meteor.com/ | sh

# install mup
npm install --global mup

# create build
meteor npm install --production


cd .deploy && mup stop && mup setup && mup deploy --settings ./settings.json
