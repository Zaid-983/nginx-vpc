resource "aws_security_group" "nginx-sg" {
    vpc_id = aws_vpc.nginx_vpc.id


    ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]

  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    name = "nginx-sg"
  }
}