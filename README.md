# This project includes Concourse CI setup on cloud.

## Included terraform modules:
* VPC with public and private subnet.
* EC2 machine in public subnet running Concourse CI.

## Dependencies:
* Terraform cli.
* AWS account. 

## Deployment steps:

* Generate a ssh key pair with name ci_key.
* run ```terraform apply``` from terminal.
 