# ==================== Docker installation ==================== #
# 1 Update
sudo apt update

# 2 Install prequisites
sudo apt install -y apt-transport-https ca-certificates curl gnupg software-properties-common lsb-release

# 3 Then add the GPG key for the official Docker repository:
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 4 Add the Docker repository to apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5 Next, update the package database with the Docker packages:
sudo apt update

# 6 Finally, install Docker:
sudo apt install -y docker-ce docker-ce-cli docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker ${USER}
