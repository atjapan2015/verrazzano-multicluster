module "vadmin" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "4.0.1"

  home_region = var.verrazzano_regions["home"]
  region      = var.verrazzano_regions["admin"]

  tenancy_id = var.tenancy_id

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = "v8o"

  # ssh keys
  ssh_private_key_path = "~/.ssh/id_rsa"
  ssh_public_key_path  = "~/.ssh/id_rsa.pub"

  # networking
  create_drg                   = true
  internet_gateway_route_rules = []
  nat_gateway_route_rules = [
    {
      destination       = "10.1.0.0/16"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = "drg"
      description       = "To Seoul"
    },
    {
      destination       = "10.2.0.0/16"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = "drg"
      description       = "To Osaka"
    },
    {
      destination       = "10.3.0.0/16"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = "drg"
      description       = "To Chuncheon"
    },
  ]

  vcn_cidrs     = ["10.0.0.0/16"]
  vcn_dns_label = "admin"
  vcn_name      = "admin"

  # bastion host
  create_bastion_host = true
  upgrade_bastion     = false

  # operator host
  create_operator                    = true
  enable_operator_instance_principal = true
  upgrade_operator                   = false

  # oke cluster options
  cluster_name                = "admin"
  control_plane_type          = "private"
  control_plane_allowed_cidrs = ["0.0.0.0/0"]
  kubernetes_version          = "v1.20.11"
  pods_cidr                   = "10.244.0.0/16"
  services_cidr               = "10.96.0.0/16"

  # node pools
  node_pools = {
    np1 = { shape = "VM.Standard.E4.Flex", ocpus = 2, memory = 32, node_pool_size = 2, boot_volume_size = 150, label = { app = "frontend", pool = "np1" } }
  }
  node_pool_name_prefix = "np-admin"

  # oke load balancers
  load_balancers          = "both"
  preferred_load_balancer = "public"
  public_lb_allowed_cidrs = ["0.0.0.0/0"]
  public_lb_allowed_ports = [80, 443]

  # freeform_tags
  freeform_tags = {
    vcn = {
      verrazzano = "admin"
    }
    bastion = {
      access     = "public",
      role       = "bastion",
      security   = "high"
      verrazzano = "admin"
    }
    operator = {
      access     = "restricted",
      role       = "operator",
      security   = "high"
      verrazzano = "admin"
    }
  }

  providers = {
    oci      = oci.admin
    oci.home = oci.home
  }
}

module "vicn" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "4.0.1"

  home_region = var.verrazzano_regions["home"]
  region      = var.verrazzano_regions["icn"]

  tenancy_id = var.tenancy_id

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = "v8o"

  # ssh keys
  ssh_private_key_path = "~/.ssh/id_rsa"
  ssh_public_key_path  = "~/.ssh/id_rsa.pub"

  # networking
  create_drg                   = true
  internet_gateway_route_rules = []
  nat_gateway_route_rules = [
    {
      destination       = "10.0.0.0/16"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = "drg"
      description       = "To Admin"
    }
  ]

  vcn_cidrs     = ["10.1.0.0/16"]
  vcn_dns_label = "icn"
  vcn_name      = "icn"

  # bastion host
  create_bastion_host = false
  upgrade_bastion     = false

  # operator host
  create_operator                    = false
  enable_operator_instance_principal = true
  upgrade_operator                   = false

  # oke cluster options
  cluster_name                = "icn"
  control_plane_type          = "private"
  control_plane_allowed_cidrs = ["0.0.0.0/0"]
  kubernetes_version          = "v1.20.11"
  pods_cidr                   = "10.245.0.0/16"
  services_cidr               = "10.97.0.0/16"

  # node pools
  node_pools = {
    np1 = { shape = "VM.Standard.E4.Flex", ocpus = 2, memory = 32, node_pool_size = 2, boot_volume_size = 150 }
  }

  # oke load balancers
  load_balancers          = "both"
  preferred_load_balancer = "public"
  public_lb_allowed_cidrs = ["0.0.0.0/0"]
  public_lb_allowed_ports = [80, 443]

  # freeform_tags
  freeform_tags = {
    vcn = {
      verrazzano = "icn"
    }
    bastion = {
      access     = "public",
      role       = "bastion",
      security   = "high"
      verrazzano = "icn"
    }
    operator = {
      access     = "restricted",
      role       = "operator",
      security   = "high"
      verrazzano = "icn"
    }
  }

  providers = {
    oci      = oci.icn
    oci.home = oci.home
  }
}

module "vkix" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "4.0.1"

  home_region = var.verrazzano_regions["home"]
  region      = var.verrazzano_regions["kix"]

  tenancy_id = var.tenancy_id

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = "v8o"

  # ssh keys
  ssh_private_key_path = "~/.ssh/id_rsa"
  ssh_public_key_path  = "~/.ssh/id_rsa.pub"

  # networking
  create_drg                   = true
  internet_gateway_route_rules = []
  nat_gateway_route_rules = [
    {
      destination       = "10.0.0.0/16"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = "drg"
      description       = "To Admin"
    }
  ]

  vcn_cidrs     = ["10.2.0.0/16"]
  vcn_dns_label = "kix"
  vcn_name      = "kix"

  # bastion host
  create_bastion_host = false
  upgrade_bastion     = false

  # operator host
  create_operator                    = false
  enable_operator_instance_principal = true
  upgrade_operator                   = false

  # oke cluster options
  cluster_name                = "kix"
  control_plane_type          = "private"
  control_plane_allowed_cidrs = ["0.0.0.0/0"]
  kubernetes_version          = "v1.20.11"
  pods_cidr                   = "10.246.0.0/16"
  services_cidr               = "10.98.0.0/16"

  # node pools
  node_pools = {
    np1 = { shape = "VM.Standard.E4.Flex", ocpus = 2, memory = 32, node_pool_size = 2, boot_volume_size = 150 }
  }

  # oke load balancers
  load_balancers          = "both"
  preferred_load_balancer = "public"
  public_lb_allowed_cidrs = ["0.0.0.0/0"]
  public_lb_allowed_ports = [80, 443]

  # freeform_tags
  freeform_tags = {
    vcn = {
      verrazzano = "kix"
    }
    bastion = {
      access     = "public",
      role       = "bastion",
      security   = "high"
      verrazzano = "kix"
    }
    operator = {
      access     = "restricted",
      role       = "operator",
      security   = "high"
      verrazzano = "kix"
    }
  }

  providers = {
    oci      = oci.kix
    oci.home = oci.home
  }
}

module "vyny" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "4.0.1"

  home_region = var.verrazzano_regions["home"]
  region      = var.verrazzano_regions["yny"]

  tenancy_id = var.tenancy_id

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = "v8o"

  # ssh keys
  ssh_private_key_path = "~/.ssh/id_rsa"
  ssh_public_key_path  = "~/.ssh/id_rsa.pub"

  # networking
  create_drg                   = true
  internet_gateway_route_rules = []
  nat_gateway_route_rules = [
    {
      destination       = "10.0.0.0/16"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = "drg"
      description       = "To Admin"
    }
  ]

  vcn_cidrs     = ["10.3.0.0/16"]
  vcn_dns_label = "yny"
  vcn_name      = "yny"

  # bastion host
  create_bastion_host = false
  upgrade_bastion     = false

  # operator host
  create_operator                    = false
  enable_operator_instance_principal = true
  upgrade_operator                   = false

  # oke cluster options
  cluster_name                = "yny"
  control_plane_type          = "private"
  control_plane_allowed_cidrs = ["0.0.0.0/0"]
  kubernetes_version          = "v1.20.11"
  pods_cidr                   = "10.247.0.0/16"
  services_cidr               = "10.99.0.0/16"

  # node pools
  node_pools = {
    np1 = { shape = "VM.Standard.E4.Flex", ocpus = 2, memory = 32, node_pool_size = 2, boot_volume_size = 150 }
  }

  # oke load balancers
  load_balancers          = "both"
  preferred_load_balancer = "public"
  public_lb_allowed_cidrs = ["0.0.0.0/0"]
  public_lb_allowed_ports = [80, 443]

  # freeform_tags
  freeform_tags = {
    vcn = {
      verrazzano = "yny"
    }
    bastion = {
      access     = "public",
      role       = "bastion",
      security   = "high"
      verrazzano = "yny"
    }
    operator = {
      access     = "restricted",
      role       = "operator",
      security   = "high"
      verrazzano = "yny"
    }
  }

  providers = {
    oci      = oci.yny
    oci.home = oci.home
  }
}
