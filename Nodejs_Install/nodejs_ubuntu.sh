#! /bin/bash

echo "
--------------------------------------------------
Installation of Nodejs and Its Dependencies
--------------------------------------------------
"
echo "
--------------------------------------------------
Installing Nodejs
--------------------------------------------------
"
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - && sudo apt-get install -y nodejs

echo "
--------------------------------------------------
NODEJS VERSION
--------------------------------------------------
"
node --version

echo "
--------------------------------------------------
Installing NPM
--------------------------------------------------
"

sudo apt install npm
npm --version

echo "
--------------------------------------------------
Installing GCC and MAKE
--------------------------------------------------
"
apt install build-essential
apt install gcc
apt install make

echo "
--------------------------------------------------
Installation of Yarn Package Manager
--------------------------------------------------
"
apt install curl
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt install yarn -y
sudo curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
sudo curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
