# modules/vm/variables.tf
variable "prefix" {
  description = "Prefix for resource creation"
  default = "gso-fsa-vl-lin01"
}
variable "vm_subnet" {
  description = "Vm Subnet"
  default = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Network/virtualNetworks/virtualNetworksValue/subnets/subnetValue"
}

variable "rg_name" {
  description = "Resource Group Name"
  default = "gso-fsa-vl-lab-westus2"
}

variable "rg_location" {
  description = "Resource Group Location"
  default = "westus2"
}

variable "vm_name" {
  description = "VM Name"
  default = "gso-fsa-vl-lin01"
}

variable "vm_size" {
  description = "VM Size"
  default = "Standard_B2s"
}

variable "vm_admin" {
  description = "Admin Login"
  default = "adminuser"
}

variable "vm_password" {
  description = "Admin Password"
  default = "Fl@sh4All!"
}