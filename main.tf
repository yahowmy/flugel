provider "aws" {
    region = var.region
}

resource "aws_instance" "flugel_ec2" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = "flugel"

    tags = {
        Name = var.instance_name
        Owner = var.owner
    }
}    
resource "aws_s3_bucket" "flugel_s3" {
    bucket = "flugel-bkt"
    tags = {
        Name = var.s3_name
        Owner = var.owner
    }
}




