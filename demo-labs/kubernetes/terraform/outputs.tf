# Output the private and public IPs of the instance

output "InstancePrivateIP" {
value = ["${data.oci_core_vnic.InstanceVnic.private_ip_address}"]
}

output "InstancePublicIP" {
value = ["${data.oci_core_vnic.InstanceVnic.public_ip_address}"]
}

## The username will be outputted in this example. Other values can also be outputted like : user_email , deployment_aauid, and deployment_short_id.
##To achieve this they have to be declared as variables and passed in the output or append them in display/host names in the resources.


output "Username" {
  value = ["${var.user_name}"]
}

output "UserEmail" {
  value = ["${var.user_email}"]
}

output "shortid" {
  value = ["${var.deployment_short_id}"]
}

output "aauid" {
  value = ["${var.deployment_auuid}"]
}
