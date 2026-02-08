output "instance_ids" {
  value = values(aws_instance.ec2)[*].id
}
