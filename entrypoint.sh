#!/bin/bash

echo "ID_RSA TEST"
echo ${ID_RSA} # *****

# install curl
apt-get update && apt install curl -y


# install meteor
curl https://install.meteor.com/ | sh

# install mup
npm install --global mup

# create build
meteor npm install --production

# Create pem
mkdir /home/yigit && mkdir /home/yigit/.ssh
echo ${ID_RSA} > /home/yigit/.ssh/id_rsa
chmod 600 /home/yigit/.ssh/id_rsa
cd .deploy && mup stop && mup setup && mup deploy --settings ./settings.json
