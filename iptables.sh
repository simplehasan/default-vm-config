#!/bin/sh

# 1. Create /etc/iptables/rules.v4 if it doesn't exist
sudo touch /etc/iptables/rules.v4

# 2. Add iptables setup using sudo and tee to handle redirection
echo " \
-A INPUT -p tcp -m state --state NEW -m tcp --dport 6443 -j ACCEPT \
-A INPUT -p tcp -m state --state NEW --match multiport --dport 2379,2380 -j ACCEPT \
-A INPUT -p tcp -m state --state NEW --match multiport --dport 10250,10256,10257,10259 -j ACCEPT \
-A INPUT -p tcp -m state --state NEW -m tcp --dport 30000:32767 -j ACCEPT \
-A INPUT -p tcp -m state --state NEW -m tcp --dport 6783 -j ACCEPT \
-A INPUT -p udp -m udp --dport 6783 -j ACCEPT \
-A INPUT -p udp -m udp --dport 6784 -j ACCEPT \
" | sudo tee /etc/iptables/rules.v4 > /dev/null

# 3. Apply iptables rules
sudo iptables-restore < /etc/iptables/rules.v4

# Optionally, save the iptables rules to persist after reboot
# sudo sh -c 'iptables-save > /etc/iptables/rules.v4'
