provider "aws" {
    region = var.region
    
}

resource "aws_instance" "flugel" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = "flugel"

    tags = {
        Name = var.instance_name
        Owner = var.owner
    }
}    


resource "aws_s3_bucket" "flugel" {
    bucket = "flugel-bokt"
    tags = {
        Name = var.instance_name
        Owner = var.owner
    }
}





