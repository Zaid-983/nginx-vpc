resource "aws_vpc" "nginx_vpc" {
    cidr_block = "10.0.0.0/20"
    tags = {
        name = "nginx_vpc"
        creator = "Terraform_User"
    }  
}

#public subnet 
resource "aws_subnet" "pubnginx-subnet" {
    cidr_block = "10.0.3.0/24"
    vpc_id = aws_vpc.nginx_vpc.id
    tags = {
        name = "pubnginx-subnet"
    }  
}
#private subnet
resource "aws_subnet" "pringinx-subnet" {
    cidr_block = "10.0.4.0/24"
    vpc_id = aws_vpc.nginx_vpc.id
    tags = {
        name = "pringinx-subnet"
    }  
}
#internet gateway
resource "aws_internet_gateway" "nginx-igw" {
    vpc_id = aws_vpc.nginx_vpc.id
    tags = {
      name = "-igw"
    }
}
#routeing table 
resource "aws_route_table" "nginx-route" {
  vpc_id = aws_vpc.nginx_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nginx-igw.id
  }
  tags = {
    Name = "my-route-table"
  }
}
#association route table
resource "aws_route_table_association" "pubnginx-subnet" {
    route_table_id = aws_route_table.nginx-route.id
    subnet_id = aws_subnet.pubnginx-subnet.id


}