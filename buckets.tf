#to do this you need to create a data resource to reference
#you can print the data info by using output.tf file to see the available options

#create a bucket with the users  account id prefixed
resource "aws_s3_bucket" "team-bucket" {
  bucket = "${data.aws_caller_identity.current.account_id}-team-bucket"
  tags = {
    Name = "dev-team-bucket"
  }
}

#create a  bucket with a dependcy on another bucket existing prior
resource "aws_s3_bucket" "team-bucket-2" {
  bucket = "${data.aws_caller_identity.current.account_id}-team-bucket-2"
  #explicit dependency
  depends_on = [
    aws_s3_bucket.team-bucket
  ]
}

#create a bucket using the locals variable in main.tf
resource "aws_s3_bucket" "private-bucket" {
  bucket = "${local.aws_account}-private-bucket"
  acl    = "private"

  tags = {
    Environment = "test"
  }
}

resource "aws_s3_bucket" "team-buckets" {
  for_each = local.buckets
  bucket   = "${local.aws_account}-${each.value}"
}