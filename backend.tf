terraform {
  backend "azurerm" {
    resource_group_name  = "zakisrg"
    storage_account_name = "zakisstorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc = true
  }
}
//adding in new branch
