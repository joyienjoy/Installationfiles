#! /bin/bash

echo "
--------------------------------------------------
Installation of Nodejs and Its Dependencies
--------------------------------------------------
Adding Nodejs Repository
--------------------------------------------------
"

curl -sL https://rpm.nodesource.com/setup_14.x | bash -

echo "
--------------------------------------------------
Installing Nodejs and gcc-c++
--------------------------------------------------
"

sudo yum install -y nodejs

sudo yum install gcc-c++

sudo yum install make
echo "
--------------------------------------------------
Installation of Yarn Package Manager
--------------------------------------------------
"
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install yarn



