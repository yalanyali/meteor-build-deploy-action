#!/bin/bash

# install curl
apt-get -qq update && apt-get -qq -y install curl bzip2 tar

# install meteor
curl https://install.meteor.com/ | sh

# install mup
npm install --global mup

rm -rf node_modules && rm -f package-lock.json

# create build
meteor npm install --production

sed -i "s/__PASSWORD__/${SSH_PASSWORD}/g" .deploy/mup.js
export METEOR_ALLOW_SUPERUSER=true && cd .deploy && mup stop && mup setup && mup deploy --settings ./settings.json
