variable "agent_name" {}
variable "activation_key" {}
variable "vpc_endpoint_id" {}
variable "security_group_arns" { type = list(string) }
variable "subnet_arns" { type = list(string) }
variable "nfs_server" {}
variable "nfs_subdirectory" {}
variable "s3_bucket_arn" {}
variable "s3_prefix" {}
variable "s3_role_arn" {}
variable "task_name" {}