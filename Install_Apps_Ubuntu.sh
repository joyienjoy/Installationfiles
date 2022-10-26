#! /bin/bash

echo "Which Application would you like to Install"

select app in tree git wget docker
do

case $app in 
"tree")
	echo "Installing tree package"
	sudo apt install tree
;;

"git")
	echo "Installing git package"
	sudo apt install git
;;

"wget")
	echo "Installing wget package"
	sudo apt install wget
;;

"docker")
	echo "Installing docker package"
	mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
	systemctl enable docker
	systemctl status docker
;;
*)
	echo "Invalid entry"
	break
;;
esac
done
echo " Required Application Installed"
