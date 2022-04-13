module "vpc" {
  source = "./module"
    vpc_cidr            = var.vpc_cidr
    ApplicationSubnetsCidr = var.ApplicationSubnetsCidr
    PublicSubnetsCidr   = var.PublicSubnetsCidr
    DataSubnetsCidr     = var.DataSubnetsCidr
    dns_support         = false
    dns_hostnames       = false
    tenancy             = "default"
    Identifier          = "Seeder-Soft"
    #Region              = "us-west-2"
    OwnerName           = "vaibhav"
    ProjectName         = "Demo"
    Environment         = "Dev"
    enable_nat_gateway  = false
}
 

