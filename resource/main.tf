# EC2 instance  


resource "aws_instance" "Ubuntu" {
    ami = "ami-04505e74c0741db8d"
    instance_type = "t2.micro"
    key_name = "New-acc"
    tags = {
        "Name" = "module-EC2"
    }
}