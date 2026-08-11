terraform {
  required_version = "1.15.8"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.901" # https://registry.terraform.io/providers/hashicorp/azuread/latest
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1" # https://registry.terraform.io/providers/hashicorp/azurerm/latest
    }
    github = {
      source  = "integrations/github"
      version = "6.13.0" # https://registry.terraform.io/providers/integrations/github/latest
    }

  }

}