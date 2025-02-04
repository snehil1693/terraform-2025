#!/bin/bash

echo "################################"
echo "Update the server"
sudo apt update -y

echo "################################"
echo "Upgrade the server"
sudo apt upgrade -y

echo "################################"
echo "Install java on  server"
sudo apt install openjdk-21-jdk fontconfig -y

echo "################################"
echo "Check the java version"
java -version

echo "################################"
echo "Install Required Dependencies"
sudo apt-get install -y ca-certificates software-properties-common

echo "################################"
echo "Add the Jenkins Repository Key"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "################################"
echo "Add the Jenkins Repository"
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "################################"
echo "Update the Package List Again"
sudo apt-get update -y

echo "################################"
echo "Install the Jenkins"
sudo apt-get install -y jenkins

echo "################################"
echo "Jenkins start and enable"
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "################################"
echo "Status of jenkins"
sudo systemctl status jenkins