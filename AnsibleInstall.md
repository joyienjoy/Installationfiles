sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible



#Create SSH key
ssh-keygen

#Connect with Node Machine
In GCP, Go to Machine --> Metadata --> Add the Ansible master's public key

#Add the machines to /etc/ansible/hosts

#Check connectivity using Ansible Command
ansible all -m ping
