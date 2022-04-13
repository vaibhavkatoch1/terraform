variable "Identifier" {
  type = string
  default = "Techo"
}
variable "CachePolicyId" {
  type = string
  default = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
}

variable "S3Bucket" {
  type = string
  default = ""
}

variable "S3OriginName" {
  type = string
  default = ".s3.amazonaws.com"
}


variable "AcmCertificateArn" {
  type = string
  default = ""
}


variable "RootObject" {
  type = string
  default = ""
}



variable "CDNAliases" {
  type = string
  default = ""
}

variable "OwnerName" {
  type = string
  default = "vaibhav"
}

variable "ProjectName" {
  type = string
  default = "devops"
}

variable "Environment" {
  type = string
  default = "Prod"
}

variable "vpc_cidr" {
  type = string
  default = "172.16.0.0/16"
}

variable "PublicSubnetsCidr" {
  type = list(string)
  default = ["172.16.48.0/20","172.16.64.0/20","172.16.80.0/20"]
}

variable "DataSubnetsCidr" {
  type = list(string)
  default= ["172.16.0.0/20","172.16.16.0/20","172.16.32.0/20"]
  description= "IPV4 CIDR blocks for the data subnets"
}

variable "ApplicationSubnetsCidr" {
  type = list(string)
  default= ["172.16.96.0/20","172.16.112.0/20","172.16.128.0/20"]
  description= "IPV4 CIDR blocks for the Application Subnets"
}

variable "dns_support" {
  type    = bool
  default = false
}

variable "dns_hostnames" {
    type = bool
    default = false
  
}

variable "tenancy" {
  type = string
  default = "default"
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}

variable "user_name"{
 description = "User Name for the SQS user"
 type        =  string
 default     =  "vaibhav"
}