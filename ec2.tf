resource "aws_instance" "Nginxserver" {
    ami                 = "ami-0fd05997b4dff7aac"
    instance_type       = "t2.micro"
    subnet_id           = aws_subnet.pubnginx-subnet.id
    vpc_security_group_ids = [aws_security_group.nginx-sg.id]
    associate_public_ip_address = true
    
    user_data = <<-EOF
                #!bin/bash
                sudo yum install nginx -y
                sudo systemctl start nginx
                EOF
    
    tags = {
      name = "Nginxserver"
    
    }

}  