## Stelligent Mini Project
This Project, after some initial configuration, will automatically deploy 1 Puppet master and 1 Puppet agent in an AWS account that is pre-configured on the local Linux system. It will also automatically configure the Puppet environment with a predetermined control-repo for Puppet code manager, and the agent will then setup and deploy a simple Nginx server, which can be navigated to at the agents AWS public DNS in any web browser.

Note: These scripts use relative paths and they need to be executed in this root directory.

## Motivation
This project is/was part of a job interview. Hopefully it goes/went well...

## Build status
Note: "This status comes from another public repo that has the same content as this one. I have included it to demonstrate a test first mentality. Travis-CI.com has access to private repos but they charge a relatively steep fee that is not justified for this type of project."
[![Build Status](https://travis-ci.org/4n0m4l0u5/control-repo2.svg?branch=production)](https://travis-ci.org/4n0m4l0u5/control-repo2)

## Screenshots

## Tech/framework used
 - Linux
 - AWS
   - Cloudformation
   - VPC
   - EC2
   - IAM
   - aws cli
   - S3
 - bash script
 - Puppet
 - Travis-CI

## Features
The comprehensive use of a few different tools to make an (almost production ready) CI/CD pipeline in AWS.

## Prerequisites
1. A computer which can be local, VM or even a (container if setup properly) with an Internet connection. Most Linux distributions should work however this deployment was only tested using Ubuntu Linux 16.04 and 18.04. Other operating systems are not guaranteed to work, but with minimal changes could be adapted.

2. [An AWS account](https://aws.amazon.com/)

3. AWS command line toolkit
 - aws cli can be installed by following this [Guide](https://docs.aws.amazon.com/cli/latest/userguide/installing.html). Please use the us-east-1 region as the default region as the AMI's in the scripts are specific to this region.
 - Create AWS IAM user and/or secret access key, with all privileges to provision ec2 instances, security groups and VPC's, subnets, etc. (eg. administrator): https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html and configure the aws cli by following the guide or running 'aws configure' ensuring you input the 'us-east-1' region as default.

4. Create an rsa SSH key with no password, (and/or) add it to an account that has access to this repository in Github. Place it in the [keys](.aws/keys) folder in this directory and name it "id-control_repo.rsa". Directions for creating the key and adding it to your Github account can be found [Here](https://help.github.com/articles/connecting-to-github-with-ssh/)

## How to use?
After the [Prerequisites](README.md#Prerequisites) are completed:
 - To create the infrastructure: 'git clone' this repo locally, and open a terminal in the local root directory (where this README.md is) and run this command:
'./aws/scripts/deploy.sh'

 - To destroy the infrastructure already created, open a terminal window in this same directory and type in the terminal: './aws/scripts/DELETE.sh'

## Lessons learned
There have been too many lessons learned to count. It has been an adventure trying to get this far and I've learned how I've been building cloud infrastructure the wrong way with a legacy mindset. There is so much more to learn!
I will say I learned there are quite a number of different tools out there to get this done. I have been in crunch time learning mode for the past two weeks, I honestly don't want to admit how much time I've put into this, but it has been quite significant.
I chose this deployment because it wasn't too simple or easy, and not too hard. Hopefully it works! If not and I run out of time, I will be forced to downgrade to a simpler setup.
I want to thank my wonderful wife and family for putting up with me and my absence the past couple weeks. Without them, I wouldn't be able to do this.
