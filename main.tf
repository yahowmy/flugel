provider "aws" {
    region = var.region
    access-key = ${{ secrets.AWS_ACCESS_KEY_ID }}
    secret-key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}    
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
    bucket = "flugel-bkt"
    tags = {
        Name = var.instance_name
        Owner = var.owner
    }
}





