#! /bin/bash

echo "
--------------------------------------------------
PROCEED AFTER CREATING REPOSITORY FILE. SEE README
--------------------------------------------------
"

sudo yum install -y mongodb-org

echo "
--------------------------------------------------
CONFIGURE MONGODB AND FIREWALL
--------------------------------------------------
"

getenforce
sudo setenforce 0
sudo sed -i s/^SELINUX=.*$/SELINUX=permissive/ /etc/selinux/config
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
sudo firewall-cmd --zone=public --add-port=27017/tcp --permanent
sudo firewall-cmd --regetenforce


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
----------------------------------------------------------------------
"
