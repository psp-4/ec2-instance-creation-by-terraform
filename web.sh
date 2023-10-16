#!/bin/bash
sudo yum install wget unzip httpd -y # The machine is RPM based.
sudo systemctl start httpd
sudo systemctl enable httpd
wget https://www.tooplate.com/zip-templates/2106_soft_landing.zip # Fetch webfiles from tooplate server
unzip -o 2106_soft_landing
mv 2106_soft_landing/* /var/www/html/
sudo systemctl restart httpd
rm -rf 2106_soft_landing
rm 2106_soft_landing.zip