#creates a policy, group, user and adds user to the group
resource "aws_iam_group_policy" "developers_policy" {
  name   = "developer_s3_policy"
  group  = aws_iam_group.developers_group.name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetObjectVersionTagging",
                "s3:GetStorageLensConfigurationTagging",
                "s3:GetObjectAcl",
                "s3:GetBucketObjectLockConfiguration",
                "s3:DeleteJobTagging",
                "s3:GetObjectVersionAcl",
                "s3:PutObjectTagging",
                "s3:DeleteObjectTagging",
                "s3:GetBucketPolicyStatus",
                "s3:GetObjectRetention",
                "s3:GetBucketWebsite",
                "s3:GetJobTagging",
                "s3:DeleteStorageLensConfigurationTagging",
                "s3:DeleteObjectVersionTagging",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "s3:GetReplicationConfiguration",
                "s3:ListMultipartUploadParts",
                "s3:PutObject",
                "s3:GetObject",
                "s3:DescribeJob",
                "s3:GetAnalyticsConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetStorageLensDashboard",
                "s3:GetLifecycleConfiguration",
                "s3:GetInventoryConfiguration",
                "s3:GetBucketTagging",
                "s3:GetBucketLogging",
                "s3:ListBucketVersions",
                "s3:ReplicateTags",
                "s3:ListBucket",
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketPolicy",
                "s3:GetEncryptionConfiguration",
                "s3:GetObjectVersionTorrent",
                "s3:PutBucketTagging",
                "s3:GetBucketRequestPayment",
                "s3:GetAccessPointPolicyStatus",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetBucketOwnershipControls",
                "s3:GetBucketPublicAccessBlock",
                "s3:ListBucketMultipartUploads",
                "s3:PutStorageLensConfigurationTagging",
                "s3:PutObjectVersionTagging",
                "s3:PutJobTagging",
                "s3:GetBucketVersioning",
                "s3:GetBucketAcl",
                "s3:GetObjectTorrent",
                "s3:GetStorageLensConfiguration",
                "s3:GetBucketCORS",
                "s3:GetBucketLocation",
                "s3:GetAccessPointPolicy",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListStorageLensConfigurations",
                "s3:GetAccessPoint",
                "s3:GetAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:ListAccessPoints",
                "s3:ListJobs"
            ],
            "Resource": "*"
        }
    ]
}  
EOF
}

resource "aws_iam_group" "developers_group" {
  name = "developers"
  path = "/users/"
}

resource "aws_iam_user" "test-developer" {
  name = "Tommy-Jones"
  tags = {
    tag-key = "dev-team"
  }
}

resource "aws_iam_user_group_membership" "add_developer_dev" {
  user   = aws_iam_user.test-developer.name
  groups = [aws_iam_group.developers_group.name]
}