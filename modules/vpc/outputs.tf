output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.main.id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value = aws_subnet.private[*].id
}

output "db_subnets" {
  description = "The ID of the database subnet"
  value = aws_subnet.db[*].id
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT gateway"
  value       = aws_nat_gateway.gw.id
}
