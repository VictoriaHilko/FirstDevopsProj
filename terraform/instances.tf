resource "aws_instance" "windows-instance-1" {
  # name = "windows-instance-1"
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.devops-subnet-public-1.id

  vpc_security_group_ids = [aws_security_group.devops_cource-all.id]

  key_name = "khilkov"

  user_data = file("server1.sh")

  tags = {
    "Name" = "windows-instance-1"
  }

}
#ami-09a53ec51d0027c28
resource "aws_instance" "windows-instance-2" {
  #name = "windows-instance-2"
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.devops-subnet-public-1.id

  vpc_security_group_ids = [aws_security_group.devops_cource-all.id]

  key_name = "khilkov"

  user_data = file("server1.sh")

  tags = {
    "Name" = "windows-instance-2"
  }

}