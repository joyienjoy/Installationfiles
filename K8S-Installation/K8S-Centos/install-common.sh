#! /bin/bash

#INSTALLATION OF K8S IN CENTOS 7 OF AZURE (PART 1)

#The following steps are executed as root user

sudo yum update -y

#Check status of firewalld, it should be disabled-deactivated 

systemctl status firewalld
systemctl stop firewalld
systemctl disable firewalld

#disable swap 
swapoff -a
sed -i '/swap/d' /etc/fstab

#Check SELinux status, it should be disabled
sestatus
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

#Perform a Reboot 
shutdown -r now
