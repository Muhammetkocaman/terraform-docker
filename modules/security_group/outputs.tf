output "sg_id" {
    description = "security_group id value."
    value = aws_security_group.docker_sg.id
}
output "sg_name" {
    description = "security_group name value."
    value = aws_security_group.docker_sg.name
}
output "sg_arn" {
    description = "security_group arn value."
    value = aws_security_group.docker_sg.arn
}