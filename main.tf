
resource "aws_instance" "my-ec2" {
  ami           = "ami-0c0933ae5caf0f5f9"
  instance_type = "t2.micro"
  key_name      = "general key.pem"
  associate_public_ip_address = true

  vpc_security_group_ids = ["${aws_security_group.sharaf-sec.id}"]
  subnet_id              = "${aws_subnet.private-subnet.id}"

}

resource "aws_security_group" "sharaf-sec" {
  name_prefix = "sharaf-sec"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = "${aws_vpc.vpc-ahmed-sharaf.id}"
  cidr_block = "10.0.1.0/24"
}

resource "aws_vpc" "vpc-ahmed-sharaf" {
  cidr_block = "10.0.0.0/16"
}
