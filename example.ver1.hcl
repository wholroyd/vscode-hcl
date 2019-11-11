# Single line with number-sign
// Single line with double-slash
/* Multiple
   lines
   */


// First Class Expressions
variable "ami"           {}
variable "instance_type" {}
variable "vpc_security_group_ids" {
  type = "list"
}

resource "aws_instance" "example" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = "${var.vpc_security_group_ids}"
}


// Expressions with Lists and Maps
resource "aws_instance" "example" {

  # The following works because the list structure is static
  vpc_security_group_ids = ["${var.security_group_1}", "${var.security_group_2}"]

  # The following doesn't work, because the [...] syntax isn't known to the interpolation language
  vpc_security_group_ids = "${var.security_group_id != "" ? [var.security_group_id] : []}"

  # Instead, it's necessary to use the list() function
  vpc_security_group_ids = "${var.security_group_id != "" ? list(var.security_group_id) : list()}"
}


// Dynamic Nested Blocks
resource "aws_autoscaling_group" "example" {
  tag {
    key                 = "Name"
    value               = "example-asg-name"
    propagate_at_launch = false
  }

  tag {
    key                 = "Component"
    value               = "user-service"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "production"
    propagate_at_launch = true
  }
}