#!/bin/bash

sudo yum update -y

# https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-amazon/
cat > /tmp/mongo-repo <<EOF
[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc
EOF

sudo mv /tmp/mongo-repo /etc/yum.repos.d/mongodb-org-8.0.repo
sudo yum install mongodb-org -y