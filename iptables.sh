#!/bin/bash

# Add Kubernetes-related TCP/UDP rules

# Kubernetes API Server port
sudo iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 6443 -j ACCEPT

# etcd ports
sudo iptables -A INPUT -p tcp -m state --state NEW --match multiport --dport 2379,2380 -j ACCEPT

# Kubelet, proxy and other Kubernetes services ports
sudo iptables -A INPUT -p tcp -m state --state NEW --match multiport --dport 10250,10256,10257,10259 -j ACCEPT

# NodePort range for Kubernetes services
sudo iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 30000:32767 -j ACCEPT

# Consul or other services
sudo iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 6783 -j ACCEPT
sudo iptables -A INPUT -p udp -m udp --dport 6783 -j ACCEPT
sudo iptables -A INPUT -p udp -m udp --dport 6784 -j ACCEPT

# Save the new iptables rules to a file (to persist across reboots)
sudo sh -c 'iptables-save > /etc/iptables/rules.v4'

# Optionally: Restore iptables rules from the saved file
# If you need to apply these saved rules later, you can use iptables-restore
# sudo iptables-restore < /etc/iptables/rules.v4

echo "Kubernetes rules added and saved successfully!"
