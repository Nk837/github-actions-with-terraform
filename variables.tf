variable "resource_group_name" {
    type = list(string)
    default = ["demo_rg", "demo_rg2"]
}

variable "storage_account_name" {
    type = list(string)
  default = ["examplestoracc6837", "examplestorageacc6837"]
}

variable "container_name" {
    type = list(string)
  default = ["tfstate", "react-calculator"]
}

variable "location" {
    type = list(string)
  default = ["East US"]
}