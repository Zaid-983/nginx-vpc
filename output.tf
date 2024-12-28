output "instance_public_ip" {
    description = "public IP address"
    value = aws_instance.Nginxserver.public_ip
  
}
output "instance_url" {
    description = "URL of the instance"
    value = "http://${ aws_instance.Nginxserver.public_ip}"
  
}