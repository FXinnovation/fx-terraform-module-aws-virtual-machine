# Terraform module: EC2

Create X EC2 instances with X extra volumes, encrypted by default.

This module creates the same kind of instances.
They share the same features.
To create different instances, calls this module multiple times.

## Notes

To install pre-commit hooks: `pre-commit install`.
It will automatically `validate`, `fmt` and update *README.md* for you.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami | AMI to be used. | string | `""` | no |
| associate\_public\_ip\_address | Associate a public IP to the instance. | string | `"false"` | no |
| disable\_api\_termination | If true, enables EC2 Instance Termination Protection. | string | `"false"` | no |
| ebs\_block\_device | Additional EBS block devices to attach to the instance. | list | `[]` | no |
| ebs\_optimized | If true, the launched EC2 instance will be EBS-optimized. | string | `"false"` | no |
| external\_volume\_count | Number of external volumes to create. | string | `"0"` | no |
| external\_volume\_device\_names | Device names for the external volumes. | list | `[ "" ]` | no |
| external\_volume\_kms\_key\_arn | KMS key used to encrypt the external volume. | string | `""` | no |
| external\_volume\_kms\_key\_create | Whether or not to create KMS key. Cannot be computed from other variable in terraform 0.11.0. | string | `"false"` | no |
| external\_volume\_kms\_key\_name | Name prefix for the KMS key to be used for external volumes. Will be suffixes with a two-digit count index. | string | `""` | no |
| external\_volume\_kms\_key\_tags | Tags for the KMS key to be used for externale volume | map | `{}` | no |
| external\_volume\_name\_suffix | Suffix of the external volumes to create. | string | `"extra-volumes"` | no |
| external\_volume\_sizes | Size of the external volumes. | list | `[ "" ]` | no |
| external\_volume\_tags | Tags for the external volumes. Will be merged with tags. Tags will be shared among all external volumes. | map | `{}` | no |
| iam\_instance\_profile | The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. | string | `""` | no |
| instance\_count | Number of instances to create. Can also be 0. | string | `"1"` | no |
| instance\_type | Instance types. | string | n/a | yes |
| key\_name | Key name for the instance. | string | `""` | no |
| monitoring | If true, the launched EC2 instance will have detailed monitoring enabled | string | `"false"` | no |
| name | Name of the instance. | string | `""` | no |
| private\_ip | Private IP of the instance. | string | `""` | no |
| root\_block\_device | Customize details about the root block device of the instance. See Block Devices below for details | list | `[]` | no |
| source\_dest\_check | Source/destination AWS check. | string | `"true"` | no |
| subnet\_ids | Subnet ids. | list | `[ "" ]` | no |
| subnet\_ids\_count | How many subnet ids in subnet_ids. Cannot be computed automatically from other variables in Terraform 0.11.X. | string | `"0"` | no |
| tags | Tags of the instance. | map | `{}` | no |
| user\_data | User data of the instance. | string | `""` | no |
| volume\_tags | Tags of the root volume of the instance. Will be merged with tags. | map | `{}` | no |
| vpc\_security\_group\_ids | Security groups. | list | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| availability\_zone |  |
| external\_volume\_arns |  |
| external\_volume\_ids |  |
| ids |  |
| kms\_key\_id |  |
| primary\_network\_interface\_ids |  |
| private\_dns |  |
| private\_ips |  |
| public\_dns |  |
| public\_ips |  |
| subnet\_ids |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
