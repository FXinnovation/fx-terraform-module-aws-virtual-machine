####
# EC2
####

output "availability_zones" {
  value = compact(
    concat(
      aws_instance.this.*.availability_zone,
      aws_instance.this_t.*.availability_zone,
      [""],
    ),
  )
}

output "arns" {
  value = compact(
    concat(aws_instance.this.*.arn, aws_instance.this_t.*.arn, [""]),
  )
}

output "credit_specifications" {
  value = aws_instance.this_t.*.credit_specification
}

output "ids" {
  value = compact(
    concat(aws_instance.this.*.id, aws_instance.this_t.*.id, [""]),
  )
}

output "private_ips" {
  value = compact(
    concat(
      aws_instance.this.*.private_ip,
      aws_instance.this_t.*.private_ip,
      [""],
    ),
  )
}

output "primary_network_interface_ids" {
  value = compact(
    concat(
      aws_instance.this.*.primary_network_interface_id,
      aws_instance.this_t.*.primary_network_interface_id,
      [""],
    ),
  )
}

output "private_dns" {
  value = compact(
    concat(
      aws_instance.this.*.private_dns,
      aws_instance.this_t.*.private_dns,
      [""],
    ),
  )
}

output "public_dns" {
  value = compact(
    concat(
      aws_instance.this.*.public_dns,
      aws_instance.this_t.*.public_dns,
      [""],
    ),
  )
}

output "public_ips" {
  value = compact(
    concat(
      aws_instance.this.*.public_ip,
      aws_instance.this_t.*.public_ip,
      [""],
    ),
  )
}

output "subnet_ids" {
  value = compact(
    concat(
      aws_instance.this.*.subnet_id,
      aws_instance.this_t.*.subnet_id,
      [""],
    ),
  )
}

####
# KMS
####

output "kms_key_id" {
  value = element(
    coalescelist([var.volume_kms_key_arn], aws_kms_key.this.*.arn),
    0,
  )
}

####
# EBS
####

output "external_volume_ids" {
  value = aws_ebs_volume.this.*.id
}

output "external_volume_arns" {
  value = aws_ebs_volume.this.*.arn
}
