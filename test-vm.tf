module "test-vm" {
  source                = "location of your code"
  create_resource_group = false
  resource_group_name   = "test-rg"
  location              = "centralindia"
  managed_disk_name     = "test-vm-osdisk"
  managed_disk_rg       = "test-vm-rg"
  Subnet_name           = "default"
  vnet_rg_name          = "test-vnet-rg"
  vnet_name             = "test-vm-vnet"
  create_public_ip      = false
  nic_name              = "test-vm-nic"
  pip_add_allocation    = "Static" #Don't change
  private_ip_address    = "10.15.62.104"
  existing_data_disk    = true
  dd_config = {
    "dd1" = {
      name                = "test-vm-datadisk-01"
      resource_group_name = "test-vm-rg"
      lun                 = "10" #don't change
      caching             = "ReadWrite"
      vmkey               = "vm1" #don't change
    }
  }
  vm_config = {
    "vm1" = {
      name          = "test-vm"
      vm_size       = "Standard_D4s_v3"
      stg_acc_type  = "Standard_LRS"
      os_type       = "Linux"
      create_option = "Attach" #don't change
    }
  }
  tags = {
    application        = "test"

  }
}
