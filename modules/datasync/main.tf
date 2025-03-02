resource "aws_datasync_agent" "this" {
  name               = var.agent_name
  activation_key     = var.activation_key
  vpc_endpoint_id    = var.vpc_endpoint_id
  security_group_arns = var.security_group_arns
  subnet_arns        = var.subnet_arns
}

resource "aws_datasync_location_nfs" "source" {
  server_hostname = var.nfs_server
  subdirectory    = var.nfs_subdirectory

  on_prem_config {
    agent_arns = [aws_datasync_agent.this.arn]
  }
}

resource "aws_datasync_location_s3" "destination" {
  s3_bucket_arn = var.s3_bucket_arn
  subdirectory  = var.s3_prefix


  s3_config {
    bucket_access_role_arn = var.s3_role_arn
  }
}

resource "aws_datasync_task" "this" {
  source_location_arn      = aws_datasync_location_nfs.source.arn
  destination_location_arn = aws_datasync_location_s3.destination.arn

  name = var.task_name

  options {
    verify_mode       = "NONE"
    atime             = "BEST_EFFORT"
    mtime             = "PRESERVE"
    uid              = "INT_VALUE"
    gid              = "INT_VALUE"
    posix_permissions = "PRESERVE"
  }
}