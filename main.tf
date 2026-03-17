provider "aws" {
  region = "ap-south-1"
}


resource "aws_vpc" "trend_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "trend-vpc"
  }
}


resource "aws_subnet" "trend_subnet" {
  vpc_id                  = aws_vpc.trend_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "trend-subnet"
  }
}


resource "aws_internet_gateway" "trend_igw" {
  vpc_id = aws_vpc.trend_vpc.id
}

resource "aws_route_table" "trend_rt" {
  vpc_id = aws_vpc.trend_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.trend_igw.id
  }
}

resource "aws_route_table_association" "trend_assoc" {
  subnet_id      = aws_subnet.trend_subnet.id
  route_table_id = aws_route_table.trend_rt.id
}

resource "aws_security_group" "trend_sg" {

  name   = "trend-sg"
  vpc_id = aws_vpc.trend_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "trend" {

  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.trend_subnet.id

  vpc_security_group_ids = [
    aws_security_group.trend_sg.id
  ]

  key_name = "devops-keypair"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install openjdk-17-jdk -y

              wget -O /usr/share/keyrings/jenkins-keyring.asc \
              https://pkg.jenkins.io/debian-stable/jenkins.io.key

              echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
              https://pkg.jenkins.io/debian-stable binary/" \
              > /etc/apt/sources.list.d/jenkins.list

              apt update -y
              apt install jenkins -y

              systemctl start jenkins
              systemctl enable jenkins
              EOF

  tags = {
    Name = "trend-server"
  }
}

resource "aws_eip" "trend_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "trend_eip_assoc" {
  instance_id   = aws_instance.trend.id
  allocation_id = aws_eip.trend_eip.id
}

output "jenkins_public_ip" {
  value = aws_eip.trend_eip.public_ip
}
