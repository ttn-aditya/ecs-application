resource "aws_route_table" "Cactus-vpc-route-table" {
    vpc_id = "${aws_vpc.Cactus-vpc.id}"

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.Cactus-vpc-internet-gateway.id}"
    }

    tags = {
      Name = "Cactus-vpc-route-table"
    }
}

resource "aws_route_table_association" "Cactus-vpc-route-table-association1" {
    subnet_id      = "${aws_subnet.Cactus-vpc-subnet1.id}"
    route_table_id = "${aws_route_table.Cactus-vpc-route-table.id}"
}

resource "aws_route_table_association" "Cactus-vpc-route-table-association2" {
    subnet_id      = "${aws_subnet.Cactus-vpc-subnet2.id}"
    route_table_id = "${aws_route_table.Cactus-vpc-route-table.id}"
}