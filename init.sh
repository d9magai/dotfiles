#!/usr/bin/env bash
set -eux

if [ -n "$(command -v yum)" ]; then
    sudo yum install -y epel-release
    sudo rpm -ivh https://rpms.remirepo.net/enterprise/remi-release-7.rpm
    sudo yum install -y --enablerepo=remi-php71 vim git nkf colordiff httpd zsh php php-cli php-mbstring php-xml php-pecl-zip php-pdo php-pecl-xdebug
elif [ -n "$(command -v apt-get)" ]; then
    sudo apt-get update >/dev/null
    sudo apt-get install -y git zsh
fi

mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQqA1PIm7jvnxmFsq2rN/3BB6tLki7xu8cTkII98GJTkelG99aoae7gL9443S1PVT8eMa/r03Q82Tk4ZkvFXkn5HweOaQTfqiWcGcbFu4DOXKNQmuLWfOstDv6rZz1kIEypBBQupqjkE8Xs3jyDghiTNYgG5doD9PtMRX5beaitzUfFVUB1md23b0EBtz7C3gR+BR1mGdRudtFHBWG4uCfam9vRJk77cCsLBamz4RMf5X5jJdhTkyvLxScAtYvfwmhhDL3vJj6Sf30sGSOTFt1gGTWxeClNkwwaYTsFFYcsoM8o4OU9ZpIFAI+lkdlAtGqbTcXZLtaXF3rm68jT7hH' >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
composer config -g repositories.packagist composer https://packagist.jp
composer global require hirak/prestissimo

