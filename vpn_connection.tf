resource "aws_vpn_connection" "this" {
  customer_gateway_id = var.cgw_id
  transit_gateway_id  = var.tgw_id
  type                = var.type

  static_routes_only       = var.routing_options
  enable_acceleration      = var.enable_acceleration
  tunnel_inside_ip_version = var.tunnel_inside_ip_version
  local_ipv4_network_cidr  = var.local_ipv4_network_cidr
  remote_ipv4_network_cidr = var.remote_ipv4_network_cidr

  tags = merge(
    {
      "Name" = format("%s-s2svpn", var.vpn_connection_name)
    },
    local.common_tags,
  )
}
