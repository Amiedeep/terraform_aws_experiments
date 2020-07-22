#!/bin/sh

yum update -y
amazon-linux-extras install docker
usermod -a -G docker ec2-user
service docker start
curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo concourse_external_url=http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):8080 > .env
docker-compose -f /home/ec2-user/docker-compose.yml up
