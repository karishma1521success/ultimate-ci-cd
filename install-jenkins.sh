#!/bin/bash


# Update the package list
sudo apt update -y

# Install Java 11
sudo apt install openjdk-17-jre -y

# Verify Java installation
java -version

# Add Jenkins repository key and repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list again to recognize Jenkins repository
sudo apt-get update

# Install Jenkins and start and enable jenkins service.
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins

# Output the default jenkins admin password
echo "Jenkins Admin Password: $(sudo cat /var/lib/jenkins/secrets/initialAdmin)"