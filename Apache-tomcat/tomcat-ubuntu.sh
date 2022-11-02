#! /bin/bash

apt-get update

echo "
JAVA Dependency will be added
------------------------------ "

sudo apt install default-jdk
java --version

echo "
-----------------------------
Apache Tomcat-9 Installation"
apt-get install tomcat9


echo "
-------------------------------------------------
Default Port is 8080.
If you want to change it, do the following
cd /etc/tomcat9/
vi server.xml

Change connection port: 8080 to your desired port
 
RUN:  systemctl restart tomcat9
-------------------------------------------------
"

