resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}


resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "ap-south-1a"
    tags = {
        Name = "public subnet"
    }
}

resource "aws_subnet" "private_app" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "private app subnet"
  }
}

resource "aws_subnet" "private_db" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.21.0/24"
    tags = {
        Name = "private db subnet"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    
    tags = {
        Name = "main-igw"
    }
}

resource "aws_eip" "ngw" {
  domain = "vpc"
}

resource "aws_nat_gateway" "ngw" {
    subnet_id = aws_subnet.public.id

    allocation_id = aws_eip.ngw_eip.id

    tags = {
      Name = "nat gw"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt_app" {
    vpc_id = aws_vpc.main.id
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.ngw.id
    }
}



resource "aws_route_table_association" "private_app" {
  subnet_id = aws_subnet.private_app.id
  route_table_id = aws_route_table.private_rt_app.id
}


resource "aws_security_group" "sg_public" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id      = aws_vpc.main.id

    tags = {
        Name = "allow_tls"
    }
        ingress {
            description = "TLS from VPC"
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = [aws_vpc.main.cidr_block]
        }

        egress {
            description = "All outbound traffic"
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
}


resource "aws_lb" "app_lb" {
  name = "application load balancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.sg_public.id]
  subnets = [aws_subnet.public.id]
}