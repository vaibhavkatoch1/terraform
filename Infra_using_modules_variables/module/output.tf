output "VpcId" {
  value = join ("-",[var.Identifier,aws_vpc.main.id,"VPC-ID"])
}

output "PublicRouteTable1" {
  value = join ("-", [var.Identifier,aws_route_table.PublicRT1.id,"Public-RT-ID"])
}

output "PrivateRouteTable1" {
  value = join ("-", [var.Identifier,aws_route_table.PrivateRT1.id,"Private-RT1-ID"])
}

output "PrivateRouteTable2" {
  value = join ("-", [var.Identifier,aws_route_table.PrivateRT2.id,"Private-RT2-ID"])
}

output "PrivateSubnet3" {
  value = join ("-", [var.Identifier,aws_route_table.PrivateRT3.id,"Private-subnetID"])
}

output "PublicSubnet1Ids" {
  value = join ("-", [var.Identifier,aws_subnet.Public-subnet1.id,"Public-Subnet1-ID"])
}

output "DataSubnetIds" {
  value = join ("-", [var.Identifier,aws_subnet.Public-subnet2.id,"Data-Subnet1-ID"])
}

output "ApplicationSubnetIds" {
  value = join ("-", [var.Identifier,aws_subnet.Application-subnet1.id,"Application-Subnet1-ID"])
}

output "PublicSubnet2Ids" {
  value = join ("-", [var.Identifier,aws_subnet.Public-subnet2.id,"Public-Subnet2-ID"])
}





