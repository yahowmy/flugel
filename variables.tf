
variable "owner" {
  description = "Name Of The owner"
  type        = string
  default     = "InfraTeam"
}

variable "region" {
  description = "AWS Region For Deployment"
  default = "us-east-1"
}

variable "instance_name" {
  description = "EC2 Name Tag"
  default     = "Flugel"
}

variable "ami_id" {
  description = "The AMI ID"
  default = "ami-087c17d1fe0178315"
}

variable "s3_name" {
  description = "S3 Name Tag."
  default     = "Flugel"
}

