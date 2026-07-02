module "resource_group" {
    #we need to define from where it will get the module, in this case we are using the Azure resource group module from the Terraform registry
  #source = https://github.com/gopal1409/kyn-han-solo-july-module26/tree/master/terraform-modules/modules/resource_group
 source              = "github.com/lvsrgit/lakkitrainingazure/terraform-modules/modules/resource_group"
  resource_name_prefix = local.resource_name_prefix
  name                = var.resource_group_name
  location            = var.resource_group_location
  tags = local.project_lucky
}

module "networking" {
  source = "github.com/lvsrgit/lakkitrainingazure/terraform-modules/modules/networking"

  resource_name_prefix = local.resource_name_prefix
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  tags                 = local.project_lucky
}

module "backend" {
  
  source = "github.com/lvsrgit/lakkitrainingazure/terraform-modules/modules/backend"

  resource_name_prefix = local.resource_name_prefix
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  tags                 = local.project_lucky
}

module "compute" {
  source = "github.com/lvsrgit/lakkitrainingazure/terraform-modules/modules/compute"

  resource_name_prefix = local.resource_name_prefix
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  subnet_id            = module.networking.subnet_id
  instance_map         = var.suzuki
  vm_size              = var.vm_size[var.environment]
  tags                 = local.project_lucky
  ssh_public_key_path  = "${path.root}/ssh-keys/terraform-azure.pem.pub"
  custom_data_path     = "${path.root}/app/app.sh"
}

module "loadbalancer" {
  source = "github.com/lvsrgit/lakkitrainingazure/terraform-modules/modules/loadbalancer"

  resource_name_prefix       = local.resource_name_prefix
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  public_ip_id               = module.backend.public_ip_id
  network_interface_ids      = module.compute.network_interface_ids
  nic_ip_configuration_names = module.compute.nic_ip_configuration_names
}