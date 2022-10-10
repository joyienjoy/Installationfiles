#! /bin/bash

echo "
--------------------------------------------------
Installation of MongoDB in Progress
--------------------------------------------------
"

sudo apt update
sudo apt install wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release

echo "
--------------------------------------------------
Supports Installed and Now Import Public Key
--------------------------------------------------
"
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg

echo "
--------------------------------------------------
Configure MongoDB repository
--------------------------------------------------
"

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

echo "
--------------------------------------------------
Install and Setting Up MOngoDB
--------------------------------------------------
"

apt update
sudo apt install mongodb-org
sudo systemctl enable --now mongod
mongod --version
systemctl status mongod

echo "
----------------------------------------------------------------------
PERFORM THE FOLLOWING STEPS

The configuration file for MongoDB is located at /etc/mongod.conf. All the needed configurations, including the database path, logs directory, etc., can be made in this file.

Enable Authentication:
security:
  authorization: enabled

Enable Remote Access on MongoDB 6.0:
# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1  # Enter 0.0.0.0,for IPv4 and IPv6 addresses


After the setup done, restart MongoDB:
systemctl restart mongod

Firewall Setup:
sudo ufw allow 27017
----------------------------------------------------------------------
"


