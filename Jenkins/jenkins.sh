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
echo "Download the Jenkins Repo Key"
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "################################"
echo "Add Jenkins Key to Source List"
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "################################"
echo "Update system file"
sudo apt update -y

echo "################################"
echo "Install Jenkins"
sudo apt install jenkins -y

echo "################################"
echo "Check Jenkins Status"
sudo systemctl status jenkins