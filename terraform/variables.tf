variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "lakki-rg" #you need to provide an default
}

variable "resource_group_location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "The environment for the resources (e.g., dev, test, prod)"
  type        = string
  default     = "dev"
}

variable "business_unit" {
  description = "The business unit for the resources"
  type        = string
  default     = "sap"
}

variable "vm_size" {
  description = "The size of the virtual machine by environment."
  type        = map(string)
  default = {
    dev  = "Standard_B1s"
    test = "Standard_F2"
    prod = "Standard_D2s_v3"
  }
}

variable "suzuki" {
  description = "Map of virtual machine instances to create."
  type        = map(string)
  default = {
    "vitara" = "maruti"
    "wagonr" = "maruti"

  }
}

 variable "suzuki2" {
  description = "Map of virtual machine instances to create."
  type        = map(string)
  default = {
    "vitara"  = "maruti"
    "wagonr"  = "maruti"

  }