# Create_ec2_terraform
This project contains code that creates an Amazon Web Services (AWS) Virtual Private Cloud (VPC) with a public and a private subnet, a security group, and an EC2 instance.

## Prerequisites
Before running this code, you need to have an AWS account and credentials with administrative privileges.

## Usage
- Clone the repository to your local machine.
- Navigate to the project directory.
- Initialize the project with terraform init.
- Preview the changes with terraform plan.
- Apply the changes with terraform apply.
- Destroy the resources with terraform destroy when finished.
## Resources
This project creates the following AWS resources:

- aws_vpc: A VPC with a CIDR block of 10.0.0.0/16.
- aws_subnet: A public subnet with a CIDR block of 10.0.1.0/24 and a private subnet with a CIDR block of 10.0.2.0/24.
- aws_security_group: A security group that allows incoming traffic on ports 22 (SSH) and 80 (HTTP) from any IP address.
- aws_instance: An EC2 instance with the Amazon Machine Image (AMI) ami-0c0933ae5caf0f5f9, an instance type of t2.micro, and the public subnet and security group created earlier.
## Variables
This project does not have any variables. All values are hardcoded in the code.

## Outputs
This project has the following outputs:

- public_ip: The public IP address of the EC2 instance.
- private_ip: The private IP address of the EC2 instance.
