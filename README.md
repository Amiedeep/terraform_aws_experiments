# This project includes experiments on provisioning services including ec2, eks, et cetera, on AWS

## Included terraform services:

* VPC with public and private subnet in each AZ.
* EC2 machine in public subnet running Concourse CI.
* EKS cluster.

## Dependencies

* Terraform cli.
* AWS account.

## Deployment steps

* Generate a ssh key pair with name ci_key.
* Run terraform apply inside each service

## TODO

VPC's public subnet need to have cluster name tag with shared value for eks setup. This need to be parametrized. For now, adding `"kubernetes.io/cluster/$cluster_name" = "shared"` works.
