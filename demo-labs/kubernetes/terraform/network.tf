resource "oci_core_virtual_network" "ExampleVCN" {
  cidr_block = "10.1.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  display_name = "TFExampleVCN"
  dns_label = "tfexamplevcn"

}

resource "oci_core_subnet" "ExampleSubnet" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  cidr_block = "10.1.20.0/24"
  display_name = "TFExampleSubnet"
  dns_label = "tfexamplesubnet"
  security_list_ids = ["${oci_core_security_list.ExampleVCNSecList.id}"]
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.ExampleVCN.id}"
  route_table_id = "${oci_core_route_table.ExampleRT.id}"
  dhcp_options_id = "${oci_core_virtual_network.ExampleVCN.default_dhcp_options_id}"
}

resource "oci_core_internet_gateway" "ExampleIG" {
  compartment_id = "${var.compartment_ocid}"
  display_name = "TFExampleIG"
  vcn_id = "${oci_core_virtual_network.ExampleVCN.id}"
}

resource "oci_core_route_table" "ExampleRT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.ExampleVCN.id}"
  display_name = "TFExampleRouteTable"
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.ExampleIG.id}"
  }
}

resource "oci_core_security_list" "ExampleVCNSecList" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "ExampleVCNSecList"
  vcn_id         = "${oci_core_virtual_network.ExampleVCN.id}"

  egress_security_rules = [{
    protocol    = "6"
    destination = "0.0.0.0/0"
  },
    {
      protocol    = "1"
      destination = "0.0.0.0/0"
    },
    {
      protocol    = "17"
      destination = "0.0.0.0/0"
    },
  ]

  ingress_security_rules = [{
    tcp_options {
      "max" = 22
      "min" = 22
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  },
  {
    tcp_options {
      "max" = 8002
      "min" = 8002
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  },
  {
    tcp_options {
      "max" = 9080
      "min" = 9080
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  },
  {
    tcp_options {
      "max" = 5901
      "min" = 5900
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  },
  {
    tcp_options {
      "max" = 8085
      "min" = 8085
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  },
  {
    tcp_options {
      "max" = 8001
      "min" = 8001
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  },
  {
    tcp_options {
      "max" = 80
      "min" = 80
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  },
    {
      icmp_options {
        "type" = 0
      }

      protocol = 1
      source   = "0.0.0.0/0"
    },
    {
      icmp_options {
        "type" = 3
        "code" = 4
      }

      protocol = 1
      source   = "0.0.0.0/0"
    },
    {
      icmp_options {
        "type" = 8
      }

      protocol = 1
      source   = "0.0.0.0/0"
    },
  ]
}
