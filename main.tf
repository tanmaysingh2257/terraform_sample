terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# It is possible to implement identity/certificate based authencation
# Since this is a sample, I have used basic authentication
provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "000000000000000000000000000000000000"
  client_id                  = "000000000000000000000000000000000000"
  client_secret              = "000000000000000000000000000000000000"
  tenant_id                  = "000000000000000000000000000000000000"
}
