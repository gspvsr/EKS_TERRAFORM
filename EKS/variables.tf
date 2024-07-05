variable "vpc_cidr" {
  type        = string
  description = "vpc_cidr"
}

variable "public_subnets" {
  type        = list(string)
  description = "public_subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "private_subnets"
}
