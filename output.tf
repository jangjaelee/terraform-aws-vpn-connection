output "vpn_connection_id" {
  value = aws_vpn_connection.this.id
}

output "vpn_connection_arn" {
  value = aws_vpn_connection.this.arn
}

output "vpn_connection_tags_all" {
  value = aws_vpn_connection.this.tags_all
}

output "vpn_connection_cgw_id" {
  value = aws_vpn_connection.this.customer_gateway_id
}

output "vpn_connection_tgw_id" {
  value = aws_vpn_connection.this.transit_gateway_attachment_id 
}
