output "datasync_agent_arn" {
  value = aws_datasync_agent.this.arn
}

output "datasync_task_arn" {
  value = aws_datasync_task.this.arn
}