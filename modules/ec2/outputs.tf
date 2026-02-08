modules/ec2/outputs.tf
output "instance_ids" {
  value = aws_instance.ec2[*].id
}