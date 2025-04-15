# Author: Abdullah Hasan
# sudo apt-get update && sudo apt-get install -y python3-pip curl

# # FIREWALL INSTALL
# sudo apt-update && sudo apt install firewalld -y
# sudo systemctl enable firewalld
# sudo firewall-cmd --state
# sudo firewall-cmd --permanent --zone=public --add-port=8000/tcp
# sudo firewall-cmd --reload


# # ADD IPTABLES RULE
# sudo iptables -l INPUT -p tcp -s 0.0.0.0/0 --dport 8000 -j ACCEPT

# DOCKER
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo usermod -aG docker ${USER}