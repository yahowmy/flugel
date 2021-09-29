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
resource "aws_security_group" "allow_ssh" {
      name        = "flugel_sg"
      description = "Allow SSH Inbound"
    
      ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    
      egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
      tags = {
        Name = "flugel-sg"
      }
    }    

resource "aws_s3_bucket" "flugel" {
    bucket = "flugel-bkt"
    tags = {
        Name = var.instance_name
        Owner = var.owner
    }
}





