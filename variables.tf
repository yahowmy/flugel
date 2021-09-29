//variable "name" {
//  description = "Name Of The Instance"
//  type        = string
//  default     = "Flugel"
//}


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
  description = "The name tag to set for the EC2 Instance."
  default     = "testing-example-instance"
}

variable "ami_id" {
  description = "The AMI ID"
  default = "ami-087c17d1fe0178315"
}
