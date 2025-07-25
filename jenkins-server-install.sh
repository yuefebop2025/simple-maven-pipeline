#!/bin/bash

# --- 1. Update the Server ---
echo "Updating the server..."
sudo yum update -y

# --- 2. Install Docker ---
echo "Installing Docker..."
sudo yum install docker -y
sudo systemctl start docker       # Start the Docker daemon
sudo systemctl enable docker      # Enable Docker to start on boot
sudo usermod -aG docker ec2-user  # Add the 'ec2-user' to the 'docker' group to run docker commands without sudo

# --- 3. Create Jenkins Data Volume Directory and Set Permissions ---
# This directory on the host will store Jenkins' data persistently.
# The jenkins user inside the Docker container typically runs with UID/GID 1000.
echo "Creating Jenkins data volume directory /var/jenkins_home..."
sudo mkdir -p /var/jenkins_home
sudo chown 1000:1000 /var/jenkins_home # Set ownership to match the Jenkins user inside the container

# --- 4. Pull and Run Jenkins Docker Container ---
echo "Pulling and running Jenkins Docker container..."

# Pull the latest LTS (Long Term Support) image specifically with JDK 17
# This ensures a stable and compatible version of Jenkins.
sudo docker pull jenkins/jenkins:lts-jdk17

# Run the Jenkins container:
# -d: Run in detached mode (in the background)
# -p 8080:8080: Maps host port 8080 to container port 8080 (for Jenkins web UI)
# -p 50000:50000: Maps host port 50000 to container port 50000 (for Jenkins agents/builds - recommended)
# --name jenkins: Assigns a memorable name to the container
# --restart unless-stopped: Configures the container to automatically restart unless manually stopped
# -v /var/jenkins_home:/var/jenkins_home: Mounts the host directory for persistent Jenkins data
sudo docker run \
    -d \
    -p 8080:8080 \
    -p 50000:50000 \
    --name jenkins \
    --restart unless-stopped \
    -v /var/jenkins_home:/var/jenkins_home \
    jenkins/jenkins:lts-jdk17

echo "--- User data script execution complete ---"
echo "Jenkins container should now be starting up in the background."
echo "You may need to log out and back into the EC2 instance (or reboot) for 'ec2-user' to fully have 'docker' group permissions."
