#!/bin/bash
sudo sysctl -w net.ipv4.ip_forward=1
sudo apt install iptables-persistent -y
sudo iptables -X
sudo iptables -F
sudo iptables -t nat -X
sudo iptables -t nat -F
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o enp0s9 -j MASQUERADE
sudo tcpdump -i enp0s8 -w capturaVM1.pcap
sudo tcpdump -i enp0s9 -w capturaVM2.pcap

