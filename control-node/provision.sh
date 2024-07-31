#!/usr/bin/env bash
echo "Instalando apache e setting it up...."
sudo su

echo "Substituindo arquivos...."
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
echo "Substituindo arquivos 2...."
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=https://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
echo "Substituindo arquivos 2...."
echo 'sslverify=false' >> /etc/yum.conf
yum clean all
yum repolist

sudo yum -y update

sudo yum -y install apel-release

echo "Instalando ansible"
sudo yum -y install ansible

cat <<EOT >> /etc/hosts
192.168.1.2 control-nonde
192.168.1.3 app01
192.168.1.4 db01
EOT







