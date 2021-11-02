# AWS Site-to-Site VPN Connection module

Terraform module which creates VPN Connection resources on AWS.

These types of resources are supported:

* [AWS VPN Connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection)


## Usage
### Create Site-to-Site VPN Connection

main.tf
```hcl
module "vpn_connection" {
  source = "git@github.com:jangjaelee//terraform-aws-vpn-connection.git"

  vpn_connection_name  = var.vpn_connection_name
  cgw_id               = var.cgw_id
  tgw_id               = var.tgw_id
  #routing_options     = var.routing_options
  #enable_acceleration = var.enable_acceleration

  tunnel_inside_ip_version  = var.tunnel_inside_ip_version
  local_ipv4_network_cidr   = var.local_ipv4_network_cidr
  remote_ipv4_network_cidr  = var.remote_ipv4_network_cidr

  env = var.env
}
```

providers.tf
```hcl
provider "aws" {
  region = var.region
  allowed_account_ids = var.account_id
  profile = "eks_service"
}
```

terraform.tf
```hcl
terraform {
  required_version = ">= 0.15.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.43.0"
    }
  }

  backend "s3" {
    bucket = "kubesphere-terraform-state-backend"
    key = "kubesphere/vpn-connection/terraform.tfstate"
    dynamodb_table = "kubesphere-terraform-state-locks"
    encrypt = true
    region = "ap-northeast-2"
    profile = "eks_service"
  }
}
```

variables.tf
```hcl
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "account_id" {
  description = "List of Allowed AWS account IDs"
  type        = list(string)
  default     = ["123456789012"]
}

variable "vpn_connection_name" {
  description = "Name to be used on all the resources as identifier for VPN Gateway Connection"
  type        = string
}

variable "cgw_id" {
  description = "The ID of the customer gateway"
  type        = string
}

variable "tgw_id" {
  description = "The ID of the EC2 Transit Gateway"
  type        = string
}

variable "type" {
  description = "The type of VPN connection. The only type AWS supports at this time is ipsec.1"
  type        = string
  default     = "ipsec.1"
}

variable "routing_options" {
  description = "The type of VPN connection. The only type AWS supports at this time is ipsec.1"
  type        = string
  default     = "false"
}

variable "enable_acceleration" {
  description = "Indicate whether to enable acceleration for the VPN connection. Supports only EC2 Transit Gateway"
  type        = string
  default     = "false"
}

variable "tunnel_inside_ip_version" {
  description = "Indicate whether the VPN tunnels process IPv4 or IPv6 traffic. Valid values are ipv4 or ipv6"
  type        = string
  default     = "ipv4"
}

variable "local_ipv4_network_cidr" {
  description = "The IPv4 CIDR on the customer gateway (on-premises) side of the VPN connection"
  type        = string
  default     = "0.0.0.0/0"
}

variable "remote_ipv4_network_cidr" {
  description = "The IPv4 CIDR on the AWS side of the VPN connection."
  type        = string
  default     = "0.0.0.0/0"
}

variable "env" {
  description = "Environment"
  type        = string
}
```

terraform.tfvars
```hcl
region                   = "ap-northeast-2"
account_id               = ["123456789012"]
vpn_connection_name      = "kubesphere-office"
cgw_id                   = "cgw-0961211c52aae09ff"
tgw_id                   = "tgw-0b4f8e631547a3035"
#routing_options          = "false"
#enable_acceleration      = "false"
tunnel_inside_ip_version = "ipv4"
local_ipv4_network_cidr  = "0.0.0.0/0"
remote_ipv4_network_cidr = "0.0.0.0/0"
env                      = "dev"
```

output.tf
```hcl
output "vpg_arn" {
  value = module.vpg.vpg_arn
}

output "vpg_tags_all" {
  value = module.vpg.vpg_tags_all
}
```
