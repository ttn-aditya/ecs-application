resource "aws_subnet" "Cactus-vpc-subnet1" {
    vpc_id     = "${aws_vpc.Cactus-vpc.id}"
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "Cactus-vpc-subnet"
    }
}

resource "aws_subnet" "Cactus-vpc-subnet2" {
    vpc_id     = "${aws_vpc.Cactus-vpc.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "Cactus-vpc-subnet"
    }
}

output "subnet1-id" {
  value = "${aws_subnet.Cactus-vpc-subnet1.id}"
}

output "subnet2-id" {
  value = "${aws_subnet.Cactus-vpc-subnet2.id}"
}