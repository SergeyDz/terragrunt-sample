locals {
  resource_group_name  = "terraform-state"
  storage_account_name = "intappdevterraformstate"
  container_name = "sample-infra"
  storage_subscription_id = "45b6efbb-2c18-4a2b-915c-fb954716b0d2"
}

remote_state {
  backend = "consul"

  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    path                  = "${path_relative_to_include()}"
    scheme                = "https"
    address               = "https://consul-cluster.consul.759cd27d-61f8-4225-a0d3-0813dc5397fa.aws.hashicorp.cloud"
  }
}

generate "provider" {
  path      = "_global_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
}
EOF
}