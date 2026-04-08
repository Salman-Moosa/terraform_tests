output "db_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}
output "db_instance_id" {
   value = aws_db_instance.db_instance.id
}