variable "vpc_cidr_block" {
  description = "CIDR Block for the VPC"
}

variable "availability_zones" {
  description = "List of Availability Zones (e.g. `['ap-southeast-2a', 'ap-southeast-2b', 'ap-southeast-2c']`)"
  default     = "['ap-southeast-2a', 'ap-southeast-2b', 'ap-southeast-2c']"
}

variable "resource_prefix" {
  description = "prefix name to use on the resource to be deployed. (will be suffixed with a random number)"
}

variable "tags" {}