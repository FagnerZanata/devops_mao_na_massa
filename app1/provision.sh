#!/usr/bin/env bash
echo "Atualizando mirror...."
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

cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdDv3rQ7/nEV0bWfO1ordHZSPWl9YZYX79I3YeNuW6rKiGdLp+aFLzO8IRQGREY9wCn0AM4KhUDMSkL1G9AA8l1oUHh5EE85KUDYi45MqLqawy72fQCUKIcIdiI3HjbuwEYxKB3H3PenwBxxhwugNmkFx1BSLoDCr28cjhJ9VxwJR8ygYww0w4wp/v5nzY6+eUjHRfkBRCK94ON7+vXr34fFjzY2resYyj1zc5JItfJGO31Ma/3UQFDQAgEigViPPxa78FrokovL45ZXi86/mtgXdE5qvPfUiZl4sC4DGHrOQHSLYMLG415he4VZvL3MxsKuWwlxWMSfBjuxFv4GJP vagrant@control-node
EOT