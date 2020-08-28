# This project includes experiments on provisioning services including ec2, eks, et cetera, on AWS

## Included terraform services:

* VPC with public and private subnet in each AZ.
* EC2 machine in public subnet running Concourse CI.
* EKS cluster.

## Pre-requisites

* Terraform cli; Tested version is v0.12.18
* AWS access_key and secret configured as either environments variables or defined in config file at ~/.aws/config.
* Ec2 module requires ssh key to be generated prior running it. You should generate a ssh key pair with name `${instance_name}_key`. 
    
    Example:

    ```bash
    ssh-keygen -t rsa -b 4096 -C "email address"
    ```

## Deployment steps

* Run `terraform apply` inside the service you want to provision.
You can override the terraform variable of a service by appending `-var` followed by key-value pair or using `-var-file` option. Run `terraform apply --help` to know more.

## TODO

VPC's public subnet need to have cluster name tag with shared value for eks setup. This need to be parametrized. For now, adding `"kubernetes.io/cluster/$cluster_name" = "shared"` works.
