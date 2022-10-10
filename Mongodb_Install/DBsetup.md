INSTALLED IN UBUNTU 20.04

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

Change MongoDB 6.0 default Data Path-
systemctl stop mongod.service

sudo mkdir -p /newdata/mongo   # A directory for databsee
sudo chown -R mongodb:mongodb  /newdata/mongo
sudo rsync -av /var/lib/mongodb  /newdata/mongo  #copy data from default directory to new directory
sudo mv /var/lib/mongodb /var/lib/mongodb.bak   #convert to .bak backup file
sudo ln -s /newdata/mongo /var/lib/mongodb   #link mongodb library to new directory
sudo systemctl daemon-reload
sudo systemctl start mongod      #restart service


USING MONGODB Database:
mongosh

1. Create User and Add role
use admin
db.createUser(
{
user: "mongdbuser",
pwd: passwordPrompt(), // or cleartext password
roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]
}
)

#Add a password

> exit

mongosh -u mongdbuser -p --authenticationDatabase admin 
#Enter password when prompted

> show dbs

STEP TO SWITCH INTO A BLANK DATABASE OR ANY DATABSE
> use mongotestdb   #mongotextdb is database name
db.employeedetails.insertOne(     #To enter an entry in db
   {F_Name: "John",
    L_NAME: "Doe",
    ID_NO: "23245",
     AGE: "25",
     TEL: "63365467666"
   }
)   

> show collections

---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------

INSTALLATION IN CENTOS

MongoDB package and its dependencies are not available in RHEL 8 and CentOS 8 package repositories. So, to install mongodb with yum or dnf command, create the following repository file with beneath contents.

sudo vi /etc/yum.repos.d/mongodb-org-4.repo

Add the text:
[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc


Following files and directory will be created once the MongoDB packages are installed.

/etc/mongod.conf — Configuration file of MongoDB [ By default localhost IP  (127.0.0.1) is bind IP and 27017 is the default port ]
/var/lib/mongo  — Data directory of MongoDB
/var/log/mongodb/mongod.log  — Log file of MongoDB
