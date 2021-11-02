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
