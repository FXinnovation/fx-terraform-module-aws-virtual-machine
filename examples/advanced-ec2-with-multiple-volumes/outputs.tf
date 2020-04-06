output "availability_zones" {
  value = module.advanced_ec2_with_multiple_volumes.availability_zones
}

output "arns" {
  value = module.advanced_ec2_with_multiple_volumes.arns
}

output "ids" {
  value = module.advanced_ec2_with_multiple_volumes.ids
}

output "private_ips" {
  value = module.advanced_ec2_with_multiple_volumes.private_ips
}

output "primary_network_interface_ids" {
  value = module.advanced_ec2_with_multiple_volumes.primary_network_interface_ids
}

output "private_dns" {
  value = module.advanced_ec2_with_multiple_volumes.private_dns
}

output "public_dns" {
  value = module.advanced_ec2_with_multiple_volumes.public_dns
}

output "public_ips" {
  value = module.advanced_ec2_with_multiple_volumes.public_ips
}

output "subnet_ids" {
  value = module.advanced_ec2_with_multiple_volumes.subnet_ids
}

output "kms_key_id" {
  value = module.advanced_ec2_with_multiple_volumes.kms_key_id
}

output "external_volume_ids" {
  value = module.advanced_ec2_with_multiple_volumes.external_volume_ids
}

output "external_volume_arns" {
  value = module.advanced_ec2_with_multiple_volumes.external_volume_arns
}
