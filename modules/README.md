# DevOps Jumia Phone Validator Challenge

This repository contains all the infrastructure that I used to Deploy tha Jumia Phone Validator App. 

## Usage

I`ve created all the infrastructure and setup the environment using Terraform modules .


The EC2 module contains some resources that sets the Virtual Machine and prepare them for Docker as well changes the SSH Port for 1337 . 

I didin`t use Ansible because with one module of terraform I could be able to provision all the resources and prepare the Docker environment for apps.


## Stones in the way
The Dockerfile in Git repository had some mistakes, like wise build both FrontEnd and Backend in local and after that build an image with Dockerfile correctly building these apps . 

The docker-compose had quotes missing in the port flag . 
Also the default image of this challenge was in a private registry so I needed to build my own images and host them in DockerHub.

The FrontEnd application were missing the endpoint instructions file to connect in BackeEnd app . So I needed to find which file in services were using the localhost endpoint . 

The Load Balancer were created using the desired rules for redirection to port 80 and 443, also the 1337 port for SSH . The SSL certificate domain used for this challenge were in ACM in AWS devops . The redirect to 443 is it working but some endpoints are using the HTTP protocol .


## Test

For test this IaC all you need is set the variables of terraform and deploy them using 

```Terraform

terraform init 

terraform plan

terraform apply 

```

Can also be accessed using the 

[Jumia Phone Validator](http://alb-jumia-phone-validator-1163753483.eu-central-1.elb.amazonaws.com/)