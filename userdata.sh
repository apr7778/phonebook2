#!/bin/bash -x

yum update -y
yum install python3 -y
yum install pip -y
pip install flask
pip3 install flask_mysql

cd /home/ec2-user
mkdir templates

MyDBURI="phonebook-rds.cp7pqf4qenlb.us-east-1.rds.amazonaws.com"
echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint

FOLDER="https://raw.githubusercontent.com/apr7778/phonebook2/"

curl -o "/home/ec2-user/templates/index.html" -L "${FOLDER}templates/index.html"
curl -o "/home/ec2-user/templates/add-update.html" -L "${FOLDER}templates/add-update.html"
curl -o "/home/ec2-user/templates/delete.html" -L "${FOLDER}templates/delete.html"
curl -o "/home/ec2-user/phonebook-app.py" -L "${FOLDER}phonebook-app.py"

python3 /home/ec2-user/phonebook-app.py