# Secure Web Server in a Custom VPC (Terraform)

A beginner friendly AWS project. It builds a custom network from scratch and runs a web server inside it, all from code.

## What it builds

```
                 Internet
                    |
            [Internet Gateway]
                    |
   +----------------+-----------------------+
   |  VPC 10.0.0.0/16                       |
   |                                        |
   |  +----------------------------------+  |
   |  | Public subnet 10.0.1.0/24        |  |
   |  |   EC2 (nginx) + Security Group   |  |
   |  +----------------------------------+  |
   |                                        |
   |  +----------------------------------+  |
   |  | Private subnet 10.0.2.0/24       |  |
   |  |   No route to the internet       |  |
   |  +----------------------------------+  |
   +----------------------------------------+
```

| Resource | What it does |
|---|---|
| VPC | My own private network in AWS |
| Public subnet | Part of the network that can talk to the internet |
| Private subnet | Part of the network that cannot be reached from the internet |
| Internet gateway | The door between the VPC and the internet |
| Route tables | Rules that decide where traffic goes |
| Security group | A firewall. Allows web traffic (port 80) from anyone and SSH (port 22) from my IP only |
| EC2 instance | A small virtual server running nginx |
| User data script | Installs nginx and creates the web page on first boot |

## Prerequisites

- An AWS account
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and configured with `aws configure`
- [Terraform](https://developer.hashicorp.com/terraform/install) version 1.5 or newer

## How to run it

1. Clone the repo and move into the folder.

```bash
   git clone https://github.com/YOUR-USERNAME/aws-vpc-ec2-terraform.git
   cd aws-vpc-ec2-terraform
```

2. Copy the example variables file and add your own IP address.

```bash
   cp terraform.tfvars.example terraform.tfvars
```

3. Download the AWS provider.

```bash
   terraform init
```

4. Preview what will be created.

```bash
   terraform plan
```

5. Build it.

```bash
   terraform apply
```

   Type `yes` when asked.

6. Wait about a minute, then open the `website_url` shown in the output.

## Clean up

Resources can cost money if left running, so always tear everything down when you are done.

```bash
terraform destroy
```

This project does not use a NAT gateway on purpose, because NAT gateways are not free.

## What I learned

- How a VPC, subnets, route tables and an internet gateway fit together
- The difference between a public and a private subnet
- How security groups control traffic in and out of an instance
- How to bootstrap a server with a user data script
- How to describe infrastructure as code with Terraform

## Ideas for next steps

- Add a bastion host so a second EC2 in the private subnet can be reached over SSH
- Add a CloudWatch alarm for high CPU usage
- Put an Application Load Balancer in front of two web servers
- Store Terraform state in S3 with locking

## Screenshots

Add screenshots here after deploying.
