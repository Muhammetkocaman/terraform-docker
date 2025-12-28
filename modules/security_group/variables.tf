variable "sg_name" {
description = "Security group name"
type = string
 default = "docker-sg" 
}
variable "tags" {
    default = "docker-security-group"
}