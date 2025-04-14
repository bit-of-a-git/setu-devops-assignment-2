#!/bin/bash

sudo yum update -y

# Installs Git and Node.js to run the web server.
# Installs Cron and Sysstat to run the custom metrics script.
sudo yum install git nodejs cronie cronie-anacron sysstat -y