#!/bin/bash

# Checks that the NAT gateway is up and the instance has internet access
until (curl -s --head https://www.google.com > /dev/null); do
  echo "Waiting for internet connectivity..."
  sleep 5
done
echo "Internet connectivity established."

# Gets the metrics script from the S3 bucket
curl -s "https://${BUCKET_DOMAIN_NAME}/custom-metrics.sh" -o /usr/local/bin/custom-metrics.sh
chmod +x /usr/local/bin/custom-metrics.sh
(crontab -l 2>/dev/null; echo "*/1 * * * * /usr/local/bin/custom-metrics.sh") | crontab -
systemctl restart crond.service
systemctl enable crond.service

git clone --depth=1 --single-branch --branch feature/devops-assignment-2 https://github.com/bit-of-a-git/spot-swap.git spot-swap

(
    cd spot-swap || exit
    {
        echo "cookie_name=${APP_COOKIE_NAME}"
        echo "cookie_password=${APP_COOKIE_PASSWORD}"
        echo "db=mongodb://${DB_PRIVATE_IP}/spotswap"

        # Cloudinary environment variables
        echo "cloudinary_name=${CLOUDINARY_NAME}"
        echo "cloudinary_key=${CLOUDINARY_KEY}"
        echo "cloudinary_secret=${CLOUDINARY_SECRET}"
    } >>.env

    npm install
    npm install pm2 -g
    pm2 start src/server.js
)
