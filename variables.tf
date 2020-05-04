variable "region" {}

variable "resource_prefix" {
  description = "prefix name to use on the resource to be deployed. (will be suffixed with a random number)"
}

#################################### variables for tags ###################################

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed."
  default = {
    Project       = "plygenom"
    Createdby     = "terraform pipeline"
  }
}
#################################### variables for VPC ###################################

variable "vpc_cidr_block" {
  description = "CIDR Block for the VPC"
}

variable "availability_zones" {
  description = "List of Availability Zones (e.g. `['ap-southeast-2a', 'ap-southeast-2b', 'ap-southeast-2c']`)"
  default     = "['ap-southeast-2a', 'ap-southeast-2b', 'ap-southeast-2c']"
}


