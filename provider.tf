provider "aws" {
  region     = var.region
  version    = "~> 2.48.0"
}

provider "random" {
version = "~> 2.2"
}


# additional provider available with provider = aws.us-region
provider "aws" {
  alias      = "us-region"
  region     = "us-east-1"
}