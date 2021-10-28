terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "5b57bfe7-823e-43b7-ad08-a5c038ee23fc"
  client_id                  = "1390c609-bb79-4814-815b-d90ac55975a2"
  client_secret              = "QOO7Q~gzJ9VpocEFnNeVrPL4X.LDtNqcxDS-j"
  tenant_id                  = "0b3ea8b7-2f64-43e3-b14a-41f2b6f95c71"
}
