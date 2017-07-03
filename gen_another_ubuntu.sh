#!/usr/bin/env bash

# Run this file as root or sudo

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

apt-get -qq update
apt-get -y -qq upgrade
echo "Installing Basic Development Software ..."
apt-get -y -qq install curl git zsh make cmake screen zip unzip

# Install Nginx + PHP + MySQL
echo  "Installing Nginx, PHP, MySQL ..."
apt-get -y -qq install nginx php php-cli php-fpm php-mcrypt php-mbstring php-xml mysql-server mysql-client
#systemctl status nginx.service

# Install composer
# Borrow from https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
echo "Installing Composer ..."
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
rm composer-setup.php
mv composer.phar /usr/local/bin/composer

echo "Generating SSH Key Pair ..."
ssh-keygen

echo "Installing Oh My Zsh ..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
