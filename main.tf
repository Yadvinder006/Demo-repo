

terraform {
  backend "remote" {
    organization = "Yakka"

    workspaces {
      name = "first_workspace"
    }
  }
}

locals {
  
  project_name = "server"
}

/*module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}*/

resource "aws_instance" "myinstance" {

    ami = "ami-0567f647e75c7bc05"
    instance_type = "t2.micro"
    
 tags = {

   Name = "Yadi-${local.project_name}"
 }
  
}
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-myrandom-1987"
  acl    = "private"
  
}

resource "aws_placement_group" "web" {
  name     = "hunky-dory-pg-1987"
  strategy = "cluster"
  
}