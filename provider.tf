provider "oci" {
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
  region           = var.verrazzano_regions["admin"]
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  alias            = "admin"
}

provider "oci" {
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
  region           = var.verrazzano_regions["home"]
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  alias            = "home"
}

provider "oci" {
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
  region           = var.verrazzano_regions["icn"]
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  alias            = "icn"
}

provider "oci" {
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
  region           = var.verrazzano_regions["kix"]
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  alias            = "kix"
}

provider "oci" {
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
  region           = var.verrazzano_regions["yny"]
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  alias            = "yny"
}
