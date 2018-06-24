#!/bin/bash
echo Creating ec2 key pair, downloading to keys folder and changing permissions...
aws ec2 create-key-pair --key-name cjc-puppet-key --query 'KeyMaterial' --output text > aws/keys/cjc-puppet-key.pem
chmod 400 aws/keys/cjc-puppet-key.pem
echo Done!
echo Creating s3 bucket and uploading your Github SSH key as well as pe.conf...
aws s3 mb s3://cjc-nobody-should-ever-use-this-name-0987654321
aws s3 cp aws/keys/id-control_repo.rsa s3://cjc-nobody-should-ever-use-this-name-0987654321 --acl authenticated-read
aws s3 cp aws/configs/pe.conf s3://cjc-nobody-should-ever-use-this-name-0987654321 --acl authenticated-read
echo Done!
aws cloudformation create-stack --stack-name cjc-puppet-test-vpc --capabilities CAPABILITY_IAM --template-body file://aws/templates/create-vpc.yaml --parameters ParameterKey=masterUserData,ParameterValue=$(base64 -w0 scripts/puppet-master.sh) ParameterKey=agentUserData,ParameterValue=$(base64 -w0 aws/scripts/puppet-agent.sh)
echo Cloudformation template uploaded and executed, now waiting...
aws cloudformation wait stack-create-complete --stack-name cjc-puppet-test-vpc
echo Stack Created! You can visit the site at $(agentec2instancePublicDns)
