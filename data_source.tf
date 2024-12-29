
# Fetch an existing EC2 instance by its tag
data "aws_instance" "example" {
  filter {
    name   = "tag:name"
    values = ["Nginxserver"]
  }
}

# Use the fetched EC2 instance information
output "instance_public_ip" {
  value = data.aws_instance.example.public_ip
}

output "instance_ami" {
  value = data.aws_instance.example.ami
}

output "instance_subnet_Id" {
  value = data.aws_instance.example.subnet_id
}

# output "vpc_id" {
#   value = data.aws_instance.example.vpc_id
# }
# Data source to fetch an existing VPC by its tag
data "aws_vpc" "example" {
  filter {
    name   = "tag:name"  # Filter by the Name tag
    values = ["nginx_vpc"]  # Replace 'my-vpc' with your VPC's Name tag value
  }
}

# Output the VPC ID
output "vpc_id" {
  value = data.aws_vpc.example.id
}
