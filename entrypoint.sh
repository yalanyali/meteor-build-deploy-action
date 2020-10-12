#!/bin/bash

# install curl
apt-get update && apt install curl -y

# install nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -

# install meteor
curl https://install.meteor.com/ | sh

# install mup
npm install --global mup

# create build
meteor npm install --production

sed -i "s/__PASSWORD__/${SSH_PASSWORD}/g" .deploy/mup.js
export METEOR_ALLOW_SUPERUSER=true && cd .deploy && mup stop && mup setup && mup deploy --settings ./settings.json
