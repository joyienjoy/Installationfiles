#! /bin/bash

echo "
--------------------------------------------------
Jenkins Installation in Progress
-------------------------------------------------
"

echo "
--------------------------------------------------
Setting Up Repository
-------------------------------------------------
"

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade

echo "
--------------------------------------------------
Add Java Dependency for Jenkins 
-------------------------------------------------
"

sudo yum install java-11-openjdk

echo "
--------------------------------------------------
Jenkins Installation Begins
-------------------------------------------------
"

sudo yum install jenkins
sudo systemctl daemon-reload


echo "
--------------------------------------------------
Setting Up Jenkins
-------------------------------------------------
"
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

echo "
------------------------------------------------------
Jenkins in Ready. Open port 8080 to access on browser
Use the Initial Admin Password below to Unlock Jenkins
------------------------------------------------------
"


sudo cat /var/lib/jenkins/secrets/initialAdminPassword
