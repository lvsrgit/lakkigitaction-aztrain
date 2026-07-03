plugin "azurerm" {
    enabled = true
    version = "0.32.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
   
}
rule "terraform_module_pinned_source" {
  enabled = false
}
rule "terraform_required_version" {
  enabled = false
}