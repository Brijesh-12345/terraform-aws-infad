
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

  rds_config = {
    primary = {
      class = "db.t3.micro"
      multi_az = true
    }
    replica = {
      class = "db.t3.micro"
    }
  }

}
