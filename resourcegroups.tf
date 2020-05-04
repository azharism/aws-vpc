resource "aws_resourcegroups_group" "plygenom-rg" {
  name = var.resource_prefix

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::AllSupported"
  ],
  "TagFilters": [
    {
      "Key": "Project",
      "Values": ["plygenom"]
    }
  ]
}
JSON
  }
}
