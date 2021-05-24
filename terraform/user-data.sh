#!/bin/bash
sudo apt update 

date > /home/ubuntu/user-data.log

sudo certbot renew --dry-run -n | tee -a /home/ubuntu/user-data.log

date >> /home/ubuntu/user-data.log
