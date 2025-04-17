#!/bin/bash
# 1 Install cri-dockerd
cd ~
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.16/cri-dockerd_0.3.16.3-0.ubuntu-jammy_amd64.deb
sudo dpkg -i cri-dockerd_0.3.16.3-0.ubuntu-jammy_amd64.deb

# 2 install apt-transport-https and ca-cert
sudo apt update && apt install -y apt-transport-https ca-certificates curl

# 3 Download the Google public signing key:
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

#turn off swap
swapoff -a

#Add K8s repository:
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
kubeadm version

echo "Kubernetes utilities have been installed successfully."
