#!/bin/bash

# install meteor
curl https://install.meteor.com/ | sh

# install mup
npm install --global mup

# create build
meteor npm install --production
cd .deploy && mup stop && mup setup && mup deploy --settings ./settings.json
