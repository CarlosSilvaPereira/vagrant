#!/bin/bash

# Turn off ubuntu interactive mode
export DEBIAN_FRONTEND=noninteractive

# Set the timezone
echo "Europe/Lisbon" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Set the kb layout
#sed -i 's/"pc105"/"macbook79"/g' /etc/default/keyboard
sed -i 's/"us"/"pt"/g' /etc/default/keyboard
apt-get install -y console-common  > /dev/null
install-keymap pt > /dev/null

# Disable IPV6 and set swappiness to 1 to improve performance
grep net.ipv6.conf.all.disable_ipv6 /etc/sysctl.conf || (echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf)
grep net.ipv6.conf.default.disable_ipv6 /etc/sysctl.conf || (echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf)
grep net.ipv6.conf.lo.disable_ipv6 /etc/sysctl.conf || (echo "net.ipv6.conf.lo.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf)
grep vm.swappiness /etc/sysctl.conf || (echo "vm.swappiness = 1" | sudo tee -a /etc/sysctl.conf)
sysctl -p

# Add Java Repo
add-apt-repository -y ppa:webupd8team/java > /dev/null

# Update and set defaults
apt-get update > /dev/null
sh -c "echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections" 2> /dev/null
sh -c "echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections" 2> /dev/null

# Install Xorg Quantal support
sudo apt-get install linux-generic-lts-quantal xserver-xorg-lts-quantal > /dev/null

# Install Java and Enhanced JCE libs
apt-get install -y oracle-java7-installer oracle-java7-unlimited-jce-policy > /dev/null

# Install xubuntu-desktop and other useful tools
apt-get install -y xubuntu-desktop eclipse firefox vim maven git > /dev/null

# Install Sublime3
add-apt-repository ppa:webupd8team/sublime-text-3 2> /dev/null
apt-get update 2> /dev/null
apt-get install sublime-text-installer 2> /dev/null
