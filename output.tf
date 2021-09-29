output "instance_id" {
  value = "${aws_instance.flugel.id}"
}

output "instance_private_ip" {
  value = "${aws_instance.flugel.private_ip}"
}