provider "aws" {
    region = var.region
}

resource "aws_instance" "flugel" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = "flugel"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        Name = var.instance_name
        Owner = var.owner
    }
}    


resource "aws_s3_bucket" "flugel" {
    bucket = "flugel-bkt"
    tags = {
        Name = var.instance_name
        Owner = var.owner
    }
}





