provider "aws" {
    region=var.region
}

resource "aws_instance" "site" {
    ami = "ami-04505e74c0741db8d"
    instance_type="t2.micro"
    key_name="devops"
    vpc_security_group_ids = ["sg-0a6138048cdcf9b12"]
        tags = {
            Name = var.name
            group = var.group
        }
}
