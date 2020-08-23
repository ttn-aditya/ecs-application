provider "aws" {  
  region  = "us-east-1"
}
resource "aws_internet_gateway" "Cactus-vpc-internet-gateway" {
  vpc_id = "${aws_vpc.Cactus-vpc.id}"

  tags = {
    Name = "Cactus-vpc-internet-gateway"
  }
}