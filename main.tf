
resource "aws_vpc" "vpc_sharaf" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-sharaf"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_sharaf.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "public subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_sharaf.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "private subnet"
  }
}

# Define the security group
resource "aws_security_group" "sharaf_security" {
  name_prefix = "sharaf-security"
  vpc_id = aws_vpc.vpc_sharaf.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sharaf-security"
  }
}

# Define the EC2 instance
resource "aws_instance" "ec2_instance" {
  ami = "ami-0c0933ae5caf0f5f9"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sharaf_security.id]
  tags = {
    Name = "ec2-instance"
  }
}
