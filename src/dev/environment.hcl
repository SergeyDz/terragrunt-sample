# This where we set subscription-wide variables for all subfolders in this directory

locals {
  environment = "${basename(get_terragrunt_dir())}"
}
