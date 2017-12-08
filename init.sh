#!/usr/bin/env bash
set -eux
cd $(dirname $0)

if [ -n "$(command -v yum)" ]; then
    sudo yum install -y epel-release
    sudo yum install -y  vim git nkf colordiff zsh
elif [ -n "$(command -v apt-get)" ]; then
    sudo apt-get update >/dev/null
    sudo apt-get install -y vim git nkf colordiff zsh curl 
fi

mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQqA1PIm7jvnxmFsq2rN/3BB6tLki7xu8cTkII98GJTkelG99aoae7gL9443S1PVT8eMa/r03Q82Tk4ZkvFXkn5HweOaQTfqiWcGcbFu4DOXKNQmuLWfOstDv6rZz1kIEypBBQupqjkE8Xs3jyDghiTNYgG5doD9PtMRX5beaitzUfFVUB1md23b0EBtz7C3gR+BR1mGdRudtFHBWG4uCfam9vRJk77cCsLBamz4RMf5X5jJdhTkyvLxScAtYvfwmhhDL3vJj6Sf30sGSOTFt1gGTWxeClNkwwaYTsFFYcsoM8o4OU9ZpIFAI+lkdlAtGqbTcXZLtaXF3rm68jT7hH' >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

./deploy.sh

