output "windows1" {
  #description = "The address of the RDS instance"
  value = aws_instance.windows-instance-1.public_dns
}

output "windows2" {
  #description = "The address of the RDS instance"
  value = aws_instance.windows-instance-2.public_dns
}

output "elb" {
  value = aws_elb.devops_cource-elb.dns_name
}

