locals {
  ec2_instances = {
    nano = {
      type   = "t2.nano"
      subnet = var.public_subnets[0]
    }
    micro = {
      type   = "t2.micro"
      subnet = var.public_subnets[1]
    }
    small = {
      type   = "t2.small"
      subnet = var.public_subnets[0]
    }
    medium = {
      type   = "t2.medium"
      subnet = var.public_subnets[1]
    }
  }
}

resource "aws_key_pair" "mykey" {
  key_name   = var.key_name
  public_key = file("../my-keypair.pub")

}

resource "aws_instance" "ec2" {
  for_each = local.ec2_instances

  ami           = var.ami_id
  instance_type = each.value.type
  subnet_id     = each.value.subnet
  key_name = aws_key_pair.mykey.key_name

  tags = {
    Name = "ec2-${each.key}"
  }
}





resource "aws_security_group" "ec2_sg" {
  ingress {
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }
}


