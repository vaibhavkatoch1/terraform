# terraform module

module "Bastion-Host" {
# It will fetch the files from this location
# "." specifies the current working directory here
    source = "./EC2_resource"
  
}