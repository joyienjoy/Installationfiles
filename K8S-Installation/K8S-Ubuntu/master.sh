TEPS FOR INSTALLING KUBERNETES ON UBUNTU
REQUIREMENTS: Master Node (2GB, 2CPU), Slave (1GB, 1CPU), Open PORT: 6443 ON BOTH NODES
LET'S FIRST UPDATE THE MACHINE
comment

#Update Ubuntu Package
apt-get update
apt-get upgrade

cat << comment
INSTALL HTTPS for Node to Node communication.
comment

#Install HTTPS and Curl
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

cat << comment
INSTAL DOCKER CONTAINER ENGINE
comment
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

cat << comment
INSTALL KUBEADM, KUBELET AND KUBECTL
comment


#Kubeadm Installation
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl
#apt-mark hold kubelet kubeadm kubectl

cat << comment
GENERATE JOINING LINK FOR WORKER NODES
comment

#Generate Worker Join Link
kubeadm init

cat << comment
SETTING UP FILE PERMISSIONS
comment

#
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

cat << comment
SETTING UP NETWORK BY WEAVE NET
comment

#Weave net installation
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s-1.11.yaml
