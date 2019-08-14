provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "http://127.0.0.1:8200"
  # token ="XXXX" best practice to use the env var VAULT_TOKEN instead 
}


data "vault_generic_secret" "vmadmin_account" {
  path = "secret/vmadmin"
}

output "vmpassword" {
  value = "${data.vault_generic_secret.vmadmin_account.data["vmpassword"]}"
  sensitive   = true
}
