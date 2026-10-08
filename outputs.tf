output "website_url" {
  description = "Open this in your browser once the instance has booted"
  value       = "http://${aws_instance.web.public_ip}"
}

output "web_server_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web.public_ip
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}
