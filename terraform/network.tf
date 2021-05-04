resource "aws_vpc" "devops_cource-vpc" {
  #Name = "devops_cource-vpc"
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false

  tags = {
    "Name" = "devops_cource-vpc"
  }
}

resource "aws_subnet" "devops-subnet-public-1" {
  #Name = "devops-subnet-public-1"
  vpc_id                  = aws_vpc.devops_cource-vpc.id
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "devops-subnet-public-1"
  }
}

resource "aws_subnet" "devops-subnet-public-2" {
  #name = "devops-subnet-public-2"
  vpc_id                  = aws_vpc.devops_cource-vpc.id
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"

  tags = {
    Name = "devops-subnet-public-2"
  }
}


resource "aws_internet_gateway" "devops_cource-igw" {
  vpc_id = aws_vpc.devops_cource-vpc.id

  tags = {
    "Name" = "devops_cource-igw"
  }
}

resource "aws_route_table" "devops_cource-rt" {
  vpc_id = aws_vpc.devops_cource-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_cource-igw.id
  }

  tags = {
    Name = "devops_cource-rt"
  }
}

resource "aws_route_table_association" "devops_cource-crta-public-subnet-1" {
  subnet_id      = aws_subnet.devops-subnet-public-1.id
  route_table_id = aws_route_table.devops_cource-rt.id
}
resource "aws_route_table_association" "devops_cource-crta-public-subnet-2" {
  subnet_id      = aws_subnet.devops-subnet-public-2.id
  route_table_id = aws_route_table.devops_cource-rt.id
}

resource "aws_security_group" "devops_cource-all" {
  name   = "devops_cource-all"
  vpc_id = aws_vpc.devops_cource-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "devops_cource-all"
  }
}