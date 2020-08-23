resource "aws_vpc" "Cactus-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  
  tags = {
    Name = "Cactus-vpc"
  }
}

output "id" {
  value = "${aws_vpc.Cactus-vpc.id}"
}