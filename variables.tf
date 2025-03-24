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
  default = ["tfstate", "$web"]
}

variable "location" {
    type = list(string)
  default = ["East US"]
}

variable "vnet" {
  default = "test"
}

variable "vm" {
  default = "test"
}

variable "admin_username" {
  default = "naveen"
}
variable "admin_password" {
  default = "Rahul.@12345"
}
