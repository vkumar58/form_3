terraform {
  required_version = ">= 0.1.0.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }

    vault = {
      version = "3.0.1"
    }
  }
}

provider "vault" {
  address = "http://localhost:8201"
  token   = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
}

provider "vault" {
  alias   = "vault_dev"
  address = "http://localhost:8201"
  token   = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
}

provider "vault" {
  alias   = "vault_prod"
  address = "http://localhost:8301"
  token   = "083672fc-4471-4ec4-9b59-a285e463a973"
}

# resource "vault_audit" "audit_dev" {
#   provider = vault.vault_dev
#   type     = "file"

#   options = {
#     file_path = "/vault/logs/audit"
#   }
# }

# resource "vault_audit" "audit_prod" {
#   provider = vault.vault_prod
#   type     = "file"

#   options = {
#     file_path = "/vault/logs/audit"
#   }
# }

# resource "vault_auth_backend" "userpass_dev" {
#   provider = vault.vault_dev
#   type     = "userpass"
# }


# resource "vault_auth_backend" "userpass_prod" {
#   provider = vault.vault_prod
#   type     = "userpass"
# }

module "account" {
  source = "./account"
}
module "payment" {
  source = "./payment"
}

module "gateway" {
  source = "./gateway"
}