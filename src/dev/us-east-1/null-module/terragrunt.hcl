include {
  path = find_in_parent_folders()
}

locals {
  module = "${basename(get_terragrunt_dir())}"

  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  region = local.region_vars.locals.region

  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  environment = local.environment_vars.locals.environment
}

terraform {
  source = "../../../../modules//null"
}

inputs = {
  module = local.module
  region = local.region
  environment = local.environment
}
