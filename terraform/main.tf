# --- 1. BUSCA DE DADOS ---
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

# Filtro específico para garantir imagem x86 (AMD) para a máquina Micro
data "oci_core_images" "ubuntu_images" {
  compartment_id           = var.compartment_id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  shape                    = "VM.Standard.E2.1.Micro" # Garante que a imagem é compatível
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

# --- 2. RECURSOS DE REDE ---
resource "oci_core_vcn" "web_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_id
  display_name   = "zero-to-prod-vcn"
}

resource "oci_core_internet_gateway" "web_ig" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.web_vcn.id
  display_name   = "zero-to-prod-ig"
}

resource "oci_core_route_table" "web_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.web_vcn.id
  display_name   = "zero-to-prod-rt"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.web_ig.id
  }
}

resource "oci_core_security_list" "web_sl" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.web_vcn.id
  display_name   = "zero-to-prod-sl"
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = 22
      min = 22
    }
  }
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = 80
      min = 80
    }
  }
}

resource "oci_core_subnet" "web_subnet" {
  cidr_block        = "10.0.1.0/24"
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.web_vcn.id
  display_name      = "zero-to-prod-subnet"
  route_table_id    = oci_core_route_table.web_rt.id
  security_list_ids = [oci_core_security_list.web_sl.id]
}

# --- 3. MÁQUINA AMD NO AD-3 (Onde você teve sucesso!) ---
resource "oci_core_instance" "web_instance" {
  # [2] corresponde ao AD-3 que você usou anteriormente
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
  
  compartment_id      = var.compartment_id
  display_name        = "zero-to-prod-vm-amd"
  shape               = "VM.Standard.E2.1.Micro"

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.ubuntu_images.images[0].id
  }

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.web_subnet.id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}

# --- 4. OUTPUT ---
output "instance_public_ip" {
  value = oci_core_instance.web_instance.public_ip
}