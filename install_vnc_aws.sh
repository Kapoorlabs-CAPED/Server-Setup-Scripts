#!/bin/bash
sudo yum update -y &&
sudo amazon-linux-extras install -y mate-desktop1.x &&
sudo bash -c 'echo PREFERRED=/usr/bin/mate-session > /etc/sysconfig/desktop' &&
sudo yum install -y tigervnc-server &&
sudo mkdir /etc/tigervnc &&
sudo bash -c 'echo localhost > /etc/tigervnc/vncserver-config-mandatory' &&
sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service &&
sudo sed -i 's/<USER>/ec2-user/' /etc/systemd/system/vncserver@.service &&
sudo systemctl daemon-reload &&
sudo systemctl enable vncserver@:5 &&
sudo systemctl start vncserver@:5 &&
sudo yum install -y mate-desktop &&
sudo amazon-linux-extras install epel -y &&
sudo yum install -y chromium