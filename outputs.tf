#use dot notation to extract the values from datatypes and data files

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_account" {
  value = local.aws_account
}

output "person1_name" {
  value = local.person1.name
}

output "person1_is_active" {
  value = local.person1.active
}

output "person2" {
  value = local.person2.name
}

output "person2_is_active" {
  value = local.person2.active
}
