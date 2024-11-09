provider "aws" {
    region = var.region_name
  
}

data "aws_availability_zones" "available" {}

locals {
   azs      = slice(data.aws_availability_zones.available.names, 0, 3)
}