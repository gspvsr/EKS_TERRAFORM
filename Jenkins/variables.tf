variable "vpc_cidr" {
  type        = string
  description = "vpc_cidr"
}

variable "public_subnets" {
  type        = list(string)
  description = "public-subnets"

}

variable "instance_type" {
  type = string
  description = "instance-type"
}