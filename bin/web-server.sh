#!/usr/bin/env bash
set -x

export PATH=$PATH:/usr/local/bin

echo "Setup WebServer"
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod -R 775 /var/www
