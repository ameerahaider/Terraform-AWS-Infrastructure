# Terraform Infrastructure on AWS Cloud

This repository contains Terraform code to deploy an infrastructure on AWS Cloud. The infrastructure includes a VPC, security groups, servers, an autoscaling group, and an application load balancer (ALB).

## Infrastructure Components

The infrastructure is divided into several modules, each responsible for provisioning specific resources:

1. **VPC Module** (`./modules/vpc/main.tf`)

   The VPC module creates a Virtual Private Cloud and its associated subnets. It includes the following components:
   - VPC with the specified CIDR block
   - Public subnets for jump servers
   - Private subnets for application servers
   - Database subnet for database instances
   - Internet Gateway to allow communication with the internet
   - NAT Gateway for private instances to access the internet

2. **Security Groups Module** (`./modules/sg/main.tf`)

   The Security Groups module creates various security groups to control inbound and outbound traffic for different resources. It includes the following security groups:
   - Jump Server Security Group
   - Application Security Group
   - Application Load Balancer Security Group
   - Database Security Group

3. **Servers Module** (`./modules/servers/main.tf`)

   The Servers module provisions EC2 instances for the jump server and database server. It also includes user data scripts to set up the database on the database server.

4. **Autoscaling Group Module** (`./modules/autoscaling_group/main.tf`)

   The Autoscaling Group module sets up an Auto Scaling Group for high availability and scalability of application instances. It configures a launch template with the required specifications for the instances.

5. **ALB Module** (`./modules/alb/main.tf`)

   The ALB module creates an Application Load Balancer to distribute incoming traffic across multiple instances in the Auto Scaling Group. It also sets up a target group to route requests to instances.

## User Data Scripts

- **Jump Server User Data**:
  This script updates the system, installs Apache web server and PHP 7, starts the Apache service, and sets up WordPress for the jump server instance.

- **Database Server User Data**:
  This script updates the system, installs MariaDB server, configures MariaDB to listen on all IP addresses, creates a database and user for the web application, and restarts the MariaDB service.

## Variables

The infrastructure code uses variables to customize the deployment according to your requirements. The `Variables.tfvar` file contains all the variables with their default values. You can modify these variables as needed to suit your use case.

The variables include options such as the VPC CIDR block, subnets, key pair, desired capacity for the Auto Scaling Group, etc. Before running the deployment, review the variables in `Variables.tfvar` and make any necessary changes.

## How to Use

To deploy the infrastructure on AWS Cloud, follow these steps:

1. Ensure you have Terraform installed on your local machine.

2. Update the `Variables.tfvar` file with the desired values for your infrastructure. Customize the VPC CIDR block, subnets, AMI ID, key pair, etc.

3. Run the following commands in the root directory of the project:

terraform init
terraform plan
terraform apply

4. After the deployment is complete, you will see the outputs in the terminal, displaying the DNS name of the ALB, the public IP of the jump server, and the private IP addresses of the instances in the Auto Scaling Group.

5. To destroy the infrastructure, run:

terraform destroy

## Note

Please exercise caution while deploying or destroying the infrastructure, as it may result in the creation or deletion of AWS resources. Make sure to review the variables carefully and verify the changes before applying them.
