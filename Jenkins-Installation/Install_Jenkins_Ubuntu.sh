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

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update

echo "
--------------------------------------------------
Add Java Dependency for Jenkins 
-------------------------------------------------
"

sudo apt update
sudo apt install openjdk-11-jre
java -version

echo "
--------------------------------------------------
Jenkins Installation Begins
-------------------------------------------------
"

sudo apt-get install jenkins


echo "
--------------------------------------------------
Setting Up Jenkins
-------------------------------------------------
"
sudo systemctl enable jenkins
sudo systemctl start jenkins
#sudo systemctl status jenkins

echo "
------------------------------------------------------
Jenkins in Ready. Open port 8080 to access on browser
Use the Initial Admin Password below to Unlock Jenkins
------------------------------------------------------
"


sudo cat /var/lib/jenkins/secrets/initialAdminPassword
