# This is where we define the region/location variable which get reused in all subfolders in this directory

locals {
  region = "${basename(get_terragrunt_dir())}"
}
