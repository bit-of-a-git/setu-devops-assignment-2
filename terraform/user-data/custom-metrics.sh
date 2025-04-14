#!/bin/bash
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)

TCP_CONN=$(netstat -an | wc -l)
IO_WAIT=$(iostat | awk 'NR==4 {print $5}')
MEM_USED_PERCENT=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
PROC_COUNT=$(ps aux | wc -l)
DISK_USED_PERCENT=$(df --output=pcent / | tr -dc '0-9')

aws cloudwatch put-metric-data --metric-name tcp_connections --dimensions Instance=$INSTANCE_ID --namespace "Custom" --value $TCP_CONN
aws cloudwatch put-metric-data --metric-name io_wait --dimensions Instance=$INSTANCE_ID --namespace "Custom" --value $IO_WAIT
aws cloudwatch put-metric-data --metric-name memory_used_percent --dimensions Instance=$INSTANCE_ID --namespace "Custom" --value "$MEM_USED_PERCENT" --unit Percent
aws cloudwatch put-metric-data --metric-name process_count --dimensions Instance=$INSTANCE_ID --namespace "Custom" --value "$PROC_COUNT" --unit Count
aws cloudwatch put-metric-data --metric-name disk_used_percent --dimensions Instance=$INSTANCE_ID --namespace "Custom" --value $DISK_USED_PERCENT --unit Percent