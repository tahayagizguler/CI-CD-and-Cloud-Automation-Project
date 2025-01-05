variable "ubuntu_ami" {
  description = "value of the ubuntu ami"
  type = string
  default = "ami-005fc0f236362e99f"
}

variable "instance_type" {
  description = "value of the instance type"
  type = string
  default = "t2.medium"

}

variable "key_name" {
  description = "value of the key name"
  type = string
  default = "UbuntuAWS"
}

variable "ports" {
  description = "value of the ports"
  type = list
  default = [22, 80, 443, 9090, 9100, 3000] 
  
}