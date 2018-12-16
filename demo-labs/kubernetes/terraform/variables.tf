variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {}

variable "private_key_path" {
  default = "./keys/kubernetes-jumpstart-key.pem"
}

variable "region" {
  default = "us-ashburn-1"
}

variable "compartment_ocid" {}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpz2Wd1ktUUfhDUyK59ZWMhgZwg/vbCnwzScTLFJS5RlASj5itdnPsvePS6qtmCHIoLFW/Ouuw8A7aMNq3bntCIGiWBexYNvCChu4Y9/KuGmzpjL/NRyl/EHhSS4jVm4LRxn9FY8dxwEgAfRHOCW0PzTZjvLiNVAkb4QzwR/0K7wQVRt4D1vInIyyLXsCNWrG5Lt/6eVz8cv7lABsat1rOejPV54tUi7Ybl4S09gr/bWvoGu7rtCAVA4+PoiGbGJ4kedSfeZHc9r+oF3X7mZih9IFaypBBIghcaS400PCgCvBIU4VA6ihMqFN/vOsPvAGpvuGI3TqLVKT7dBqaZ1o7 derek@hathor.fios-router.home"
}

variable "ssh_private_key" {
  default = "./keys/ssh-key"
}

# Choose an Availability Domain
variable "AD" {
  default = "1"
}

variable "InstanceShape" {
  default = "VM.Standard2.1"
}

variable "InstanceImageOCID" {
  type = "map"

  default = {
    // Oracle-provided image "Oracle-Linux-7.4-2017.12.18-0"
    // See https://docs.us-phoenix-1.oraclecloud.com/Content/Resources/Assets/OracleProvidedImageOCIDs.pdf
    //us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaav4gjc4l232wx5g5drypbuiu375lemgdgnc7zg2wrdfmmtbtyrc5q"

    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaaqsvykqhjjayjm6ffoy2tcc7t3bklnoqytg5sll2qthfrbinu5vpa"
    //eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt1.aaaaaaaajdge4yzm5j7ci7ryzte7f3qgcekljjw7p6nexhnsvwt6hoybcu3q"
  }
}

variable "256GB" {
  default = "50"
}

variable "BootStrapFile" {
  default = "./userdata/bootstrap"
}

variable "user_name" {}
variable "deployment_short_id" {}
variable "deployment_auuid" {}
variable "user_email" {}
