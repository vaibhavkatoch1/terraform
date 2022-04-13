resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  enable_dns_support = var.dns_support
  enable_dns_hostnames = var.dns_hostnames
  instance_tenancy = var.tenancy

  tags = {
    Name = join ("-", [var.Identifier,var.Environment])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"
  }
}

resource "aws_subnet" "Public-subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PublicSubnetsCidr[0]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"public-subnet-1"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_subnet" "Public-subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PublicSubnetsCidr[1]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"public-subnet-2"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_subnet" "Public-subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PublicSubnetsCidr[2]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"public-subnet-3"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_subnet" "Data-subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.DataSubnetsCidr[0]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"data-subnet-1"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_subnet" "Data-subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.DataSubnetsCidr[1]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"data-subnet-2"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_subnet" "Data-subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.DataSubnetsCidr[2]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"data-subnet-3"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_subnet" "Application-subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.ApplicationSubnetsCidr[0]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"application-subnet-1"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_subnet" "Application-subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.ApplicationSubnetsCidr[1]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"application-subnet-2"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_subnet" "Application-subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.ApplicationSubnetsCidr[2]

    tags = {
    Name = join ("-", [var.Identifier,var.Environment,"application-subnet-3"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"

  }
}

resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = join ("-", [var.Identifier,var.Environment,"igw"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"
  }
}

resource "aws_route_table" "PublicRT1" {
  vpc_id = aws_vpc.main.id

  route {
    gateway_id = aws_internet_gateway.Igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = join ("-", [var.Identifier,var.Environment,"public-rt-1"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"
  }
}

resource "aws_route_table" "PrivateRT1" {
  vpc_id = aws_vpc.main.id
  count =  var.enable_nat_gateway == true ? 1 : 0
  route {
    gateway_id = aws_nat_gateway.NatGateway1[0].id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = join ("-", [var.Identifier,var.Environment,"private-rt-1"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"
  }
}

resource "aws_route_table" "PrivateRT1a" {
  vpc_id = aws_vpc.main.id
  count =  var.enable_nat_gateway == true ? 0 : 1
  route {
  }
  tags = {
    Name = join ("-", [var.Identifier,var.Environment,"private-rt-1"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"
  }
}

resource "aws_route_table" "PrivateRT2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = join ("-", [var.Identifier,var.Environment,"private-rt-2"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"
  }
}

resource "aws_route_table" "PrivateRT3" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = join ("-", [var.Identifier,var.Environment,"private-rt-3"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"
  }
}

resource "aws_route_table_association" "PublicSubnet1RTAssociation" {
  subnet_id      = aws_subnet.Public-subnet1.id
  route_table_id = aws_route_table.PublicRT1.id
}

resource "aws_route_table_association" "PublicSubnet2RTAssociation" {
  subnet_id      = aws_subnet.Public-subnet2.id
  route_table_id = aws_route_table.PublicRT1.id
}

resource "aws_route_table_association" "PublicSubnet3RTAssociation" {
  subnet_id      = aws_subnet.Public-subnet3.id
  route_table_id = aws_route_table.PublicRT1.id
}

resource "aws_route_table_association" "DataSubnet1RTAssociation" {
 count = var.enable_nat_gateway == true ? 1 : 0
  subnet_id      = aws_subnet.Data-subnet1.id 
  route_table_id = aws_route_table.PrivateRT1.id
}

resource "aws_route_table_association" "DataSubnet1RTAssociationa"{ 
 count = var.enable_nat_gateway == true ? 0 : 1 
  subnet_id      = aws_subnet.Data-subnet1.id 
  route_table_id = aws_route_table.PrivateRT1a[0].id
}

resource "aws_route_table_association" "DataSubnet2RTAssociation" {
  count = var.enable_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.Data-subnet2.id
  route_table_id = aws_route_table.PrivateRT1.id
}

resource "aws_route_table_association" "DataSubnet2RTAssociationa" {
  count = var.enable_nat_gateway == true ? 0 : 1
  subnet_id      = aws_subnet.Data-subnet2.id
  route_table_id = aws_route_table.PrivateRT1a[0].id
}

resource "aws_route_table_association" "DataSubnet3RTAssociation" {
  count = var.enable_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.Data-subnet3.id
  route_table_id = aws_route_table.PrivateRT1.id
}

resource "aws_route_table_association" "DataSubnet3RTAssociationa" {
  count = var.enable_nat_gateway ? 0 : 1
  subnet_id      = aws_subnet.Data-subnet3.id
  route_table_id = aws_route_table.PrivateRT1a[0].id
}

resource "aws_route_table_association" "AppSubnet1RTAssociation" {
  count = var.enable_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.Application-subnet1.id
  route_table_id = aws_route_table.PrivateRT1[0].id
}

resource "aws_route_table_association" "AppSubnet1RTAssociationa" {
  count = var.enable_nat_gateway ? 0 : 1
  subnet_id      = aws_subnet.Application-subnet1.id
  route_table_id = aws_route_table.PrivateRT1a[0].id
}
resource "aws_route_table_association" "AppSubnet2RTAssociation" {
  subnet_id      = aws_subnet.Application-subnet2.id
  route_table_id = aws_route_table.PrivateRT2.id
}

resource "aws_route_table_association" "AppSubnet3RTAssociation" {
  subnet_id      = aws_subnet.Application-subnet3.id
  route_table_id = aws_route_table.PrivateRT3.id
}

resource "aws_eip" "NatGatewayEIP1" {
  count = var.enable_nat_gateway == true ? 1 : 0
  vpc   = true
}

resource "aws_nat_gateway" "NatGateway1" {
  count = var.enable_nat_gateway == true ? 1 : 0
  depends_on = [aws_eip.NatGatewayEIP1]
  allocation_id = aws_eip.NatGatewayEIP1[0].id
  subnet_id     = aws_subnet.Public-subnet1.id

  tags = {
    Name = join ("-", [var.Identifier,var.Environment,"nat-1"])
  }
}



resource "aws_network_acl" "Acl" {
  vpc_id = aws_vpc.main.id
  subnet_ids     = [aws_subnet.Public-subnet1.id,aws_subnet.Public-subnet2.id,aws_subnet.Public-subnet3.id,aws_subnet.Data-subnet1.id,aws_subnet.Data-subnet2.id,aws_subnet.Data-subnet3.id,aws_subnet.Application-subnet1.id,aws_subnet.Application-subnet2.id,aws_subnet.Application-subnet3.id]

  tags = {
    Name = join ("-", [var.Identifier,var.Environment,"acl"])
    Owner = "${var.OwnerName}"
    Project =  "${var.ProjectName}"
    Environment = "${var.Environment}"
  }
}

resource "aws_network_acl_rule" "AllowAllInboundTrafic" {
  network_acl_id = aws_network_acl.Acl.id
  rule_number    = 100
  egress         = false
  protocol       = "all"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22

}







