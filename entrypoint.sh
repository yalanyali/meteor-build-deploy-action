#!/bin/bash

# install meteor
curl https://install.meteor.com/ | sh

# install mup
npm install --global mup

# create build
meteor npm install --production

# create pem
echo $ID_RSA > /home/yigit/.ssh/id_rsa
chmod 600 /home/yigit/.ssh/id_rsa

# deploy
cd .deploy && mup stop && mup setup && mup deploy --settings ./settings.json
