locals {
  resource_name_prefix = "${var.business_unit}-${var.environment}" #sap-dev

  project_lucky = {
    Project      = "Terraform"
    Environment  = var.environment
    BusinessUnit = var.business_unit
    costcenter   = "sap007"
    Application  = "CRM"
  }
}