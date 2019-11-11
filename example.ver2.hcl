# Single line with number-sign
// Single line with double-slash


// First Class Expressions
variable "ami"           {}
variable "instance_type" {}
variable "vpc_security_group_ids" {
  type = "list"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = var.vpc_security_group_ids
}


// Expressions with Lists and Maps
resource "aws_instance" "example" {
  vpc_security_group_ids = var.security_group_id != "" ? [var.security_group_id] : []
}


// For Expressions for List and Map Transformations
output "instance_public_ip_addresses" {
  value = {
    for instance in aws_instance.example:
    instance.id => instance.public
    if instance.associate_public_ip_address
  }
}


// Dynamic Nested Blocks
locals {
  standard_tags = {
    Component   = "user-service"
    Environment = "production"
  }
}
resource "aws_autoscaling_group" "example" {
  tag {
    key                 = "Name"
    value               = "example-asg-name"
    propagate_at_launch = false
  }

  dynamic "tag" {
    for_each = local.standard_tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}


// Resource for_each
variable "subnet_numbers" {
  description = "Map from availability zone to the number that should be used for each availability zone's subnet"
  default     = {
    "eu-west-1a" = 1
    "eu-west-1b" = 2
    "eu-west-1c" = 3
  }
}
resource "aws_subnet" "example" {
  for_each = var.subnet_numbers

  vpc_id            = aws_vpc.example.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(aws_vpc.example.cidr_block, 8, each.value)
}


// Full Splat Operator
output "instance_net_ip_addrs" {
  value = google_compute_instance.example.network_interface[*].access_config[0].assigned_nat_ip
}


// Conditional Operator Improvements
locals {
  first_id = length(azurerm_virtual_machine.example) > 0 ? azurerm_virtual_machine.example[0].id : ""

  buckets = (var.env == "dev" ? [var.build_bucket, var.qa_bucket] : [var.prod_bucket])
}


// Template Syntax
locals {
  lb_config = <<EOT
%{ for instance in opc_compute_instance.example ~}
server ${instance.label} ${instance.ip_address}:8080
%{ endfor }
EOT
}


// Complex Values
module "subnets" {
  source = "./subnets"

  parent_vpc_id = "vpc-abcd1234"
  networks = {
    production_a = {
      network_number    = 1
      availability_zone = "us-east-1a"
    }
    production_b = {
      network_number    = 2
      availability_zone = "us-east-1b"
    }
    staging_a = {
      network_number    = 1
      availability_zone = "us-east-1a"
    }
  }
}


// Rich Types
variable "environment_name" {
  type = string
}
variable "networks" {
  type = map(object({
    network_number    = number
    availability_zone = string
    tags              = map(string)
  }))
}


// Resources and Modules as Values
output "vpc" {
  value = aws_vpc.example
}