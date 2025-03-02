module "datasync" {
  source = "./modules/datasync"

  agent_name          = "my-datasync-agent"
  activation_key      = "YOUR_ACTIVATION_KEY"
  vpc_endpoint_id     = "vpce-1234567890abcdef"
  security_group_arns = ["arn:aws:ec2:region:account:security-group/sg-0123456789abcdef"]
  subnet_arns        = ["arn:aws:ec2:region:account:subnet/subnet-0123456789abcdef"]

  nfs_server       = "192.168.1.100"
  nfs_subdirectory = "/data"

  s3_bucket_arn = "arn:aws:s3:::my-destination-bucket"
  s3_prefix     = "backup/"
  s3_role_arn   = "arn:aws:iam::account:role/MyS3AccessRole"

  task_name = "nfs-to-s3-sync"
}