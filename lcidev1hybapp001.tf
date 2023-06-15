module "lcidev1hybapp001" {
  source                = "git::https://xkmjl6xcuanap5betn3m43lagh5y6llpn6lq5bqfpaxep7cynvca@dev.azure.com/IRL-INFRA-DEVOPS/IRL-MODULES/_git/IRL-MODULES//azurerm_snapshot_vm"
  create_resource_group = false
  resource_group_name   = "rsg-ci-ecom-dev-hyb-01"
  location              = "centralindia"
  managed_disk_name     = "lcidev1hybapp001-osdisk"
  managed_disk_rg       = "rsg-ci-ecom-dev-hyb-01"
  Subnet_name           = "snt-ci-ecom-dev-hyb-app-02"
  vnet_rg_name          = "rsg-ci-ecom-dev-net-01"
  vnet_name             = "vnt-ci-ecom-dev-spk-01"
  create_public_ip      = false
  nic_name              = "nic-ci-ecom-dev-hyb-04"
  pip_add_allocation    = "Static" #Don't change
  private_ip_address    = "10.15.62.104"
  existing_data_disk    = true
  dd_config = {
    "dd1" = {
      name                = "lcidev1hybapp001-datadisk-01"
      resource_group_name = "rsg-ci-ecom-dev-hyb-01"
      lun                 = "10" #don't change
      caching             = "ReadWrite"
      vmkey               = "vm1" #don't change
    }
  }
  vm_config = {
    "vm1" = {
      name          = "lcidev1hybapp001"
      vm_size       = "Standard_D4s_v3"
      stg_acc_type  = "Standard_LRS"
      os_type       = "Linux"
      create_option = "Attach" #don't change
    }
  }
  tags = {
    application        = "Hybris"
    Application_Name   = ""
    Application_Owner  = ""
    Env                = ""
    environment        = "uat"
    IRL-business-owner = "Abhiraj Anand"
    Resource_Owner     = ""
    tower              = "Ecom"
  }
}
