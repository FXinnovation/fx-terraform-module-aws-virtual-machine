data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

// This is needed to circumvent:
// https://github.com/terraform-providers/terraform-provider-aws/issues/1352
data "aws_subnet" "instance_subnet" {
  id = "${var.subnet_id != "" ? var.subnet_id : element(data.aws_subnet_ids.all.ids, 0)}"
}

module "this" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.21.0"

  use_num_suffix = true

  name           = "${var.name}"
  instance_count = "${var.instance_count}"

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  subnet_id              = "${var.subnet_id != "" ? var.subnet_id : element(data.aws_subnet_ids.all.ids, 0)}"
  key_name               = "${var.key_name}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  iam_instance_profile   = "${var.iam_instance_profile}"

  associate_public_ip_address = "${var.associate_public_ip_address}"
  private_ip                  = "${var.private_ip}"

  source_dest_check       = "${var.source_dest_check}"
  disable_api_termination = "${var.disable_api_termination}"

  ebs_optimized     = "${var.ebs_optimized}"
  volume_tags       = "${var.volume_tags}"
  ebs_block_device  = "${var.ebs_block_device}"
  root_block_device = "${var.root_block_device}"

  tags = "${merge(map("Name", format("%s", var.name)), map("Terraform", "true"), var.tags)}"
}

resource "aws_volume_attachment" "this_ec2" {
  count = "${var.instance_count > 0 ? var.external_volume_count * var.instance_count : 0}"

  device_name = "${element(var.external_volume_device_names, count.index)}"
  volume_id   = "${element(aws_ebs_volume.this.*.id, count.index)}"
  instance_id = "${element(module.this.id, count.index % var.instance_count)}"
}

resource "aws_ebs_volume" "this" {
  count = "${var.instance_count > 0 ? var.external_volume_count * var.instance_count : 0}"

  availability_zone = "${data.aws_subnet.instance_subnet.availability_zone}"
  size              = "${element(var.external_volume_sizes, floor(count.index / var.instance_count) % var.external_volume_count)}"

  encrypted  = true
  kms_key_id = "${element(coalescelist(list(var.external_volume_kms_key_arn), aws_kms_key.this.*.arn), 0)}"

  tags = "${var.external_volume_tags}"
}

resource "aws_kms_key" "this" {
  count = "${var.instance_count > 0 && var.external_volume_kms_key_create ? 1 : 0}"

  description = "KMS key for ${var.name} external volume."

  tags = "${merge(map("Name", format("%s", var.name)), map("Terraform", "true"), var.tags, var.external_volume_kms_key_tags)}"
}
