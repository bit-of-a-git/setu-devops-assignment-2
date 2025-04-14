#!/bin/bash

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 3600")
METADATA_URL="http://169.254.169.254/latest/meta-data"

PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" "${METADATA_URL}/local-ipv4")

sed -i "s/bindIp: 127.0.0.1/&, ${PRIVATE_IP}/" /etc/mongod.conf

systemctl start mongod
systemctl enable mongod