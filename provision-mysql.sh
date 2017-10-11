#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# set default password to root
sh -c "echo 'mysql-server mysql-server/root_password password root' | debconf-set-selections" 2> /dev/null
sh -c "echo 'mysql-server mysql-server/root_password_again password root' | debconf-set-selections" 2> /dev/null

# install mysql-server
sudo apt-get install -y mysql-server libmysql-java > /dev/null
