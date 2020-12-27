output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_account" {
  value = local.aws_account
}